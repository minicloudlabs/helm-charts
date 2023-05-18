{{/*
Generate common Ingress object
Usage: {{ include "common.objects.ingress" .  | nindent 0 }}
*/}}
{{- define "common.objects.ingress" -}}
  {{- $ingressSupportsIngressClassName := eq (include "common.ingress.supportsIngressClassName" .) "true" -}}
  {{- $ingressSupportsPathType := eq (include "common.ingress.supportsPathType" .) "true" -}}
  {{- $fullName := include "common.names.fullname" . -}}
  {{- $servicePort := .Values.service.port -}}
  {{- $ingressPath := .Values.ingress.path -}}
  {{- $ingressPathType := .Values.ingress.pathType -}}
  {{- $extraPaths := .Values.ingress.extraPaths -}}
---
apiVersion: {{ include "common.ingress.apiVersion" . }}
kind: Ingress
metadata:
  name: {{ .Values.ingress.name | default $fullName }}
  namespace: {{ include "common.names.namespace" . }}
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
    {{- with .Values.ingress.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- with .Values.ingress.annotations }}
  annotations:
    {{- range $key, $value := . }}
    {{ $key }}: {{ tpl $value $ | quote }}
    {{- end }}
  {{- end }}
spec:
  {{- if and $ingressSupportsIngressClassName .Values.ingress.ingressClassName }}
  ingressClassName: {{ .Values.ingress.ingressClassName | quote }}
  {{- end -}}
{{- if .Values.ingress.tls }}
  tls:
{{ tpl (toYaml .Values.ingress.tls) $ | indent 4 }}
{{- end }}
  rules:
  {{- if .Values.ingress.hosts  }}
  {{- range .Values.ingress.hosts }}
    - host: {{ tpl . $}}
      http:
        paths:
          - path: {{ $ingressPath }}
            {{- if $ingressSupportsPathType }}
            pathType: {{ $ingressPathType }}
            {{- end }}
            backend: {{- include "common.ingress.backend" (dict "serviceName" $fullName "servicePort" $servicePort "context" $)  | nindent 14 }}
          {{- with $extraPaths }}
          {{- toYaml . | nindent 10 }}
          {{- end }}
  {{- end }}
  {{- else }}
    - http:
        paths:
          - backend: {{- include "common.ingress.backend" (dict "serviceName" $fullName "servicePort" $servicePort "context" $)  | nindent 14 }}
            {{- if $ingressPath }}
            path: {{ $ingressPath }}
            {{- end }}
            {{- if $ingressSupportsPathType }}
            pathType: {{ $ingressPathType }}
            {{- end }}
  {{- end -}}
{{- end }}

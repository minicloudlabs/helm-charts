{{/*
Generate common NetworkPolicy object
Usage: {{ include "common.objects.NetworkPolicy" .  | nindent 0 }}
*/}}
{{- define "common.objects.NetworkPolicy" -}}
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ include "common.names.fullname" . }}
  namespace: {{ include "common.names.namespace" . }}
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
{{- if .Values.labels }}
{{ toYaml .Values.labels | indent 4 }}
{{- end }}
{{- with .Values.annotations }}
  annotations:
{{ toYaml . | indent 4 }}
{{- end }}
spec:
  podSelector:
    matchLabels:
    {{- include "common.labels.selectorLabels" . | nindent 6 }}
  {{- if .Values.networkPolicy.ingress.selectors }}
  ingress:
    - from:
      {{-  toYaml .Values.networkPolicy.ingress.selectors | nindent 6 }}
    - ports:
      - port: {{ .Values.service.targetPort }}
  {{- end }}
{{- end }}

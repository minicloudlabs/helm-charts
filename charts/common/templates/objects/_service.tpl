{{/*
Generate common Service object
Usage: {{ include "common.objects.Service" .  | nindent 0 }}
*/}}
{{- define "common.objects.Service" -}}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.names.fullname" . }}
  namespace: {{ include "common.names.namespace" . }}
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
{{- if .Values.service.labels }}
{{ toYaml .Values.service.labels | indent 4 }}
{{- end }}
{{- with .Values.service.annotations }}
  annotations:
{{ toYaml . | indent 4 }}
{{- end }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - name: http
      port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
  selector:
    {{- include "common.labels.selectorLabels" . | nindent 4 }}
{{- end }}

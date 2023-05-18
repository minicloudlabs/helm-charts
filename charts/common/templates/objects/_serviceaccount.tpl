{{/*
Generate common ServiceAccount object
Usage: {{ include "common.objects.ServiceAccount" .  | nindent 0 }}
*/}}
{{- define "common.objects.ServiceAccount" -}}
---
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
{{- with .Values.serviceAccount.annotations }}
  annotations:
{{ toYaml . | indent 4 }}
{{- end }}
  name: {{ include "common.names.serviceAccountName" . }}
  namespace: {{ include "common.names.namespace" . }}
{{- end }}

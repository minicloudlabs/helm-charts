{{/*
Generate common PersistentVolumeClaim object
Usage: {{ include "common.objects.PersistentVolumeClaim" .  | nindent 0 }}
*/}}
{{- define "common.objects.PersistentVolumeClaim" -}}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ include "common.names.fullname" . }}
  namespace: {{ include "common.names.namespace" . }}
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
  {{- with .Values.persistence.annotations }}
  annotations:
{{ toYaml . | indent 4 }}
  {{- end }}
  {{- with .Values.persistence.finalizers }}
  finalizers:
{{ toYaml . | indent 4 }}
  {{- end }}
spec:
  accessModes:
    {{- range .Values.persistence.accessModes }}
    - {{ . | quote }}
    {{- end }}
  resources:
    requests:
      storage: {{ .Values.persistence.size | quote }}
  {{- if .Values.persistence.storageClassName }}
  storageClassName: {{ .Values.persistence.storageClassName }}
  {{- end -}}
  {{- with .Values.persistence.selectorLabels }}
  selector:
    matchLabels:
{{ toYaml . | indent 6 }}
  {{- end }}
{{- end }}

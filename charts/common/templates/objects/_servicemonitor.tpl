{{/*
Generate common ServiceMonitor object
Usage: {{ include "common.objects.ServiceMonitor" .  | nindent 0 }}
*/}}
{{- define "common.objects.ServiceMonitor" -}}
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "common.names.fullname" . }}
  {{- if .Values.serviceMonitor.namespace }}
  namespace: {{ .Values.serviceMonitor.namespace }}
  {{- else }}
  namespace: {{ include "common.names.namespace" . }}
  {{- end }}
  labels:
    {{- include "common.labels.baseLabels" . | nindent 4 }}
    {{- if .Values.serviceMonitor.labels }}
    {{- toYaml .Values.serviceMonitor.labels | nindent 4 }}
    {{- end }}
spec:
  endpoints:
  - port: {{ .Values.service.portName }}
    {{- with .Values.serviceMonitor.interval }}
    interval: {{ . }}
    {{- end }}
    {{- with .Values.serviceMonitor.scrapeTimeout }}
    scrapeTimeout: {{ . }}
    {{- end }}
    honorLabels: true
    path: {{ .Values.serviceMonitor.path }}
    scheme: {{ .Values.serviceMonitor.scheme }}
    {{- if .Values.serviceMonitor.tlsConfig }}
    tlsConfig:
    {{- toYaml .Values.serviceMonitor.tlsConfig | nindent 6 }}
    {{- end }}
    {{- if .Values.serviceMonitor.relabelings }}
    relabelings:
    {{- toYaml .Values.serviceMonitor.relabelings | nindent 4 }}
    {{- end }}
  jobLabel: "{{ .Release.Name }}"
  selector:
    matchLabels:
      {{- include "common.labels.selectorLabels" . | nindent 8 }}
  namespaceSelector:
    matchNames:
      - {{ .Release.Namespace }}
{{- end }}

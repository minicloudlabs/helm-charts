{{/*
Chart selector labels
Usage: {{ include "common.labels.selectorLabels" . }}
*/}}
{{- define "common.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart base labels
Usage: {{ include "common.labels.baseLabels" . }}
*/}}
{{- define "common.labels.baseLabels" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
{{ include "common.labels.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ mustRegexReplaceAllLiteral "@sha.*" .Values.image.tag "" | default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.extraLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

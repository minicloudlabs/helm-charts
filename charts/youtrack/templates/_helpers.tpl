{{- define "youtrack.labels" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
{{ include "youtrack.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ .Values.image.tag | default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.extraLabels }}
{{ toYaml .Values.extraLabels }}
{{- end }}
{{- end -}}

{{- define "youtrack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "youtrack.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{- define "youtrack.ingress.isStable" -}}
  {{- eq (include "youtrack.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{- define "youtrack.ingress.supportsIngressClassName" -}}
  {{- or (eq (include "youtrack.ingress.isStable" .) "true") (and (eq (include "youtrack.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{- define "youtrack.ingress.supportsPathType" -}}
  {{- or (eq (include "youtrack.ingress.isStable" .) "true") (and (eq (include "youtrack.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

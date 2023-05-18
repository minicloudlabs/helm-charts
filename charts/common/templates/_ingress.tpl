{{/*
Appropriate ingress apiVersion for current KubeVersion
Usage: {{ include "common.ingress.apiVersion" . }}
*/}}
{{- define "common.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/*
Check whether ingress api version is stable
Usage: {{ include "common.ingress.isStable" . }}
*/}}
{{- define "common.ingress.isStable" -}}
  {{- eq (include "common.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/*
Check whether ingress supports class names
Usage: {{ include "common.ingress.supportsIngressClassName" . }}
*/}}
{{- define "common.ingress.supportsIngressClassName" -}}
  {{- or (eq (include "common.ingress.isStable" .) "true") (and (eq (include "common.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Check whether ingress supports path types
Usage: {{ include "common.ingress.supportsPathType" . }}
*/}}
{{- define "common.ingress.supportsPathType" -}}
  {{- or (eq (include "common.ingress.isStable" .) "true") (and (eq (include "common.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Generate backend entry that is compatible with all Kubernetes versions
Usage: {{ include "common.ingress.backend" (dict "serviceName" "backendName" "servicePort" "backendPort" "context" $) }}
Params:
  - serviceName - String. Name of an existing service backend
  - servicePort - String/Int. Port name (or number) of the service
  - context - Dict. The context for the template evaluation
*/}}
{{- define "common.ingress.backend" -}}
{{- if eq (include "common.ingress.isStable" .context) "true" -}}
service:
  name: {{ .serviceName }}
  port:
    {{- if typeIs "string" .servicePort }}
    name: {{ .servicePort }}
    {{- else if or (typeIs "int" .servicePort) (typeIs "float64" .servicePort) }}
    number: {{ .servicePort | int }}
    {{- end }}
{{- else -}}
serviceName: {{ .serviceName }}
servicePort: {{ .servicePort }}
{{- end -}}
{{- end -}}

{{- define "gatus.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{- define "gatus.ingress.isStable" -}}
  {{- eq (include "gatus.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{- define "gatus.ingress.supportsIngressClassName" -}}
  {{- or (eq (include "gatus.ingress.isStable" .) "true") (and (eq (include "gatus.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{- define "gatus.ingress.supportsPathType" -}}
  {{- or (eq (include "gatus.ingress.isStable" .) "true") (and (eq (include "gatus.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

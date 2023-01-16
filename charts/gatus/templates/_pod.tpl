{{- define "gatus.pod" -}}
{{- if .Values.hostNetwork.enabled }}
hostNetwork: true
{{- end }}
{{- if .Values.image.pullSecrets }}
imagePullSecrets:
  {{- range .Values.image.pullSecrets }}
  - name: {{ . }}
  {{- end }}
{{- end }}
serviceAccountName: {{ template "gatus.serviceAccountName" . }}
automountServiceAccountToken: {{ .Values.serviceAccount.autoMount }}
securityContext:
  {{- toYaml .Values.podSecurityContext | nindent 2 }}
containers:
  - name: {{ .Chart.Name }}
    securityContext:
      {{- toYaml .Values.securityContext | nindent 6 }}
    image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
    imagePullPolicy: {{ .Values.image.pullPolicy }}
    ports:
      - name: http
        containerPort: {{ .Values.service.targetPort }}
        protocol: TCP
    {{- if .Values.env }}
    env:
    {{- range $key, $value := .Values.env }}
        - name: "{{ $key }}"
          value: "{{ $value }}"
    {{- end }}
    {{- end }}
    envFrom:
      - configMapRef:
          name: {{ include "gatus.fullname" . }}
      {{- if .Values.secrets }}
      - secretRef:
          name: {{ include "gatus.fullname" . }}
      {{- end }}
    {{- if .Values.readinessProbe.enabled }}
    readinessProbe:
      httpGet:
        path: /health
        port: http
    {{- end }}
    {{- if .Values.livenessProbe.enabled }}
    livenessProbe:
      httpGet:
        path: /health
        port: http
    {{- end }}
    resources:
{{ toYaml .Values.resources | trim | indent 6 }}
    volumeMounts:
      - name: {{ template "gatus.fullname" . }}-config
        mountPath: /config
        readOnly: true
      {{- if .Values.persistence.enabled }}
      - name: {{ template "gatus.fullname" . }}-data
        mountPath: {{ .Values.persistence.mountPath }}
        {{- if .Values.persistence.subPath }}
        subPath: {{ .Values.persistence.subPath }}
        {{- end }}
      {{- end }}
    {{- range .Values.extraVolumeMounts }}
      - name: {{ .name }}
        mountPath: {{ .mountPath }}
        subPath: {{ .subPath | default "" }}
        readOnly: {{ .readOnly }}
    {{- end }}
volumes:
  - name: {{ template "gatus.fullname" . }}-config
    configMap:
      name: {{ template "gatus.fullname" . }}
  {{- if .Values.persistence.enabled }}
  - name: {{ template "gatus.fullname" . }}-data
    persistentVolumeClaim:
      claimName: {{ .Values.persistence.existingClaim | default (include "gatus.fullname" .) }}
  {{- end }}
{{- range .Values.extraVolumeMounts }}
  - name: {{ .name }}
    {{- if .existingClaim }}
    persistentVolumeClaim:
      claimName: {{ .existingClaim }}
    {{- else if .hostPath }}
    hostPath:
      path: {{ .hostPath }}
      type: {{ .hostPathType | default "" }}
    {{- else if .existingConfigMap }}
    configMap:
      name: {{ .existingConfigMap }}
    {{- else }}
    emptyDir: {}
    {{- end }}
{{- end }}
{{- with .Values.nodeSelector }}
nodeSelector:
{{ toYaml . | indent 2 }}
{{- with .Values.tolerations }}
tolerations:
{{ toYaml . | indent 2 }}
{{- end }}
{{- end }}

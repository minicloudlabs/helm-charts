{{- define "youtrack.pod" -}}
{{- if .Values.hostNetwork.enabled }}
hostNetwork: true
{{- end }}
{{- if .Values.image.pullSecrets }}
imagePullSecrets:
  {{- range .Values.image.pullSecrets }}
  - name: {{ . }}
  {{- end }}
{{- end }}
serviceAccountName: {{ include "common.names.serviceAccountName" . }}
automountServiceAccountToken: {{ .Values.serviceAccount.autoMount }}
securityContext:
  {{- toYaml .Values.podSecurityContext | nindent 2 }}
{{- if .Values.extraInitContainers }}
initContainers:
{{- toYaml .Values.extraInitContainers | nindent 2 }}
{{- end }}
containers:
  - name: {{ .Chart.Name }}
    {{- if .Values.image.sha }}
    image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}@sha256:{{ .Values.image.sha }}"
    {{- else }}
    image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
    {{- end }}
    imagePullPolicy: {{ .Values.image.pullPolicy }}
    ports:
      - name: http
        containerPort: {{ .Values.service.targetPort }}
        protocol: TCP
    resources:
      {{- toYaml .Values.resources | nindent 6 }}
      {{- if .Values.persistence.enabled }}
    volumeMounts:
      - name: {{ include "common.names.fullname" . }}
        mountPath: /opt/youtrack/data
        subPath: data
      - name: {{ include "common.names.fullname" . }}
        mountPath: /opt/youtrack/conf
        subPath: conf
      - name: {{ include "common.names.fullname" . }}
        mountPath: /opt/youtrack/logs
        subPath: logs
      - name: {{ include "common.names.fullname" . }}
        mountPath: /opt/youtrack/backups
        subPath: backups
      - name: {{ include "common.names.fullname" . }}-temp
        mountPath: /opt/youtrack/temp
      {{- end }}
{{- with .Values.nodeSelector }}
nodeSelector:
  {{- toYaml . | nindent 8 }}
{{- end }}
{{- with .Values.affinity }}
affinity:
  {{- toYaml . | nindent 8 }}
{{- end }}
{{- with .Values.tolerations }}
  tolerations:
    {{- toYaml . | nindent 8 }}
{{- end }}
{{- if .Values.persistence.enabled }}
volumes:
  - name: {{ include "common.names.fullname" . }}
    persistentVolumeClaim:
      claimName: {{ .Values.persistence.existingClaim | default (include "common.names.fullname" .) }}
  - name: {{ include "common.names.fullname" . }}-temp
    emptyDir: {}
{{- end }}
{{- end }}

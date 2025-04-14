{{/*
Create the name of the service account to use
*/}}
{{- define "prowler.worker_beat.serviceAccountName" -}}
{{- if .Values.worker_beat.serviceAccount.create }}
{{- default (include "prowler.fullname" .) .Values.worker_beat.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.worker_beat.serviceAccount.name }}
{{- end }}
{{- end }}
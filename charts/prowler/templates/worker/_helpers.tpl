{{/*
Create the name of the service account to use
*/}}
{{- define "prowler.worker.serviceAccountName" -}}
{{- if .Values.worker.serviceAccount.create }}
{{- default (include "prowler.fullname" .) .Values.worker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.worker.serviceAccount.name }}
{{- end }}
{{- end }}
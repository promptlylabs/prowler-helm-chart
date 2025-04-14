{{/*
Create the name of the service account to use
*/}}
{{- define "prowler.ui.serviceAccountName" -}}
{{- if .Values.ui.serviceAccount.create }}
{{- default (include "prowler.fullname" .) .Values.ui.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.ui.serviceAccount.name }}
{{- end }}
{{- end }}
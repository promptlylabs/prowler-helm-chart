{{/*
Create the name of the service account to use
*/}}
{{- define "prowler.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create }}
{{- default (include "prowler.fullname" .) .Values.api.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.api.serviceAccount.name }}
{{- end }}
{{- end }}
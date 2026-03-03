{{- define "flask-cicd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-cicd.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "flask-cicd.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-cicd.labels" -}}
app.kubernetes.io/name: {{ include "flask-cicd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{- end -}}

{{- define "flask-cicd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "flask-cicd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

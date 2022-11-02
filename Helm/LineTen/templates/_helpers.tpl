{{/*
Root domain
*/}}
{{- define "subscription-api.rootDomain" -}}
{{- if .Values.rootDomain -}}
{{- .Values.rootDomain -}}
{{- else if eq .Values.environmentType "prod-ent" -}}
{{- printf "thomas.co" -}}
{{- else if eq .Values.environmentType "dev-ent" -}}
{{- printf "thomas.co" -}}
{{- else -}}
{{- printf "thomascloud.io" -}}
{{- end -}}
{{- end -}}

{{/*
Path
*/}}
{{- define "subscription-api.path" -}}
{{- if eq .Values.environment "prod-ent" "dev-ent" -}}
{{- printf "/subscription" -}}
{{- else -}}
{{- printf "/subscription-%s" .Values.environment -}}
{{- end -}}
{{- end -}}


{{/* vim: set filetype=mustache: */}}
{{/*
Site host name; depends on environment.
*/}}
{{- define "subscription-api.host" -}}
{{- printf "thomas-international-enterprise-aks-%s.%s.cloudapp.azure.com" .Values.environmentType .Values.location -}}
{{- end -}}

{{/*
Number of replicas.
*/}}
{{- define "subscription-api.replicaCount" -}}
{{- if .Values.replicaCount -}}
{{- .Values.replicaCount -}}
{{- else if eq .Values.environmentType "prod-ent" -}}
{{- 3 -}}
{{- else -}}
{{- 1 -}}
{{- end -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "subscription-api.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "subscription-api.fullname" -}}
{{- $name:= .Chart.Name -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "subscription-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "subscription-api.labels" -}}
app.kubernetes.io/name: {{ include "subscription-api.name" . }}
helm.sh/chart: {{ include "subscription-api.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "subscription-api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "subscription-api.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


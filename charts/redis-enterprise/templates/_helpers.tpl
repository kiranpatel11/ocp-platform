{{- define "redis-enterprise.labels" -}}
app.kubernetes.io/managed-by: {{ .Values.global.managedBy | default "ocp-platform" }}
platform.ocp-gitops.io/cluster: {{ .Values.global.clusterName | default "demo-env" }}
app.kubernetes.io/part-of: redis-enterprise
{{- end }}

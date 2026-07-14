{{- define "cluster-rbac.labels" -}}
app.kubernetes.io/managed-by: {{ .Values.global.managedBy | default "ocp-gitops" }}
platform.ocp-gitops.io/cluster: {{ .Values.global.clusterName | default "demo-env" }}
{{- end }}

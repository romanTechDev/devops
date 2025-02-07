{{ define "list_of_summary_and_description" }}
  {{ range .Alerts }}
  {{ .Labels.alertname }}

  {{ .Annotations.description }}
  {{ end }}
{{ end }}
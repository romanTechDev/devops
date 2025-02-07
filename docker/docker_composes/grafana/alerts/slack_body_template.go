{{ define "slack_body_russian" }}
  {{ range .Alerts }}
    {{ .Annotations.description }}
  {{ end }}
{{ end }}
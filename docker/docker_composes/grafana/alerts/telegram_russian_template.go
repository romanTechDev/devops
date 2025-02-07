{{ define "telegram_russian" }}
  {{ if gt (len .Alerts.Firing) 0 }}📛 Ошибка {{ len .Alerts.Firing }}
    {{ template "list_of_summary_and_description" .Alerts.Firing }}
  {{ end }}
  {{ if gt (len .Alerts.Resolved) 0 }}✅ Решено {{ len .Alerts.Resolved }}
    {{ template "list_of_summary_and_description" .Alerts.Resolved }}
  {{ end }}
{{ end }}
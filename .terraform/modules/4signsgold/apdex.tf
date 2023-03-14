### APDEX

resource "newrelic_alert_condition" "apdex" {
  count     = var.apdex_alerts_enable == true ? 1 : 0
  name      = "apdex"
  policy_id = var.policy_channel
  type      = "apm_app_metric"
  entities  = [var.apm_entity]

  condition_scope = "application"
  metric          = "apdex"

  term {
    duration      = var.duration_apdex
    operator      = var.operator_apdex
    priority      = var.priority_apdex
    threshold     = var.threshold_apdex
    time_function = var.time_function_apdex
  }
}

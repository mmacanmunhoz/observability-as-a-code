### THROUGHPUT

resource "newrelic_alert_condition" "throughput" {
  count     = var.throughput_alerts_enable == true ? 1 : 0
  name      = "throughput"
  policy_id = var.policy_channel
  type      = "apm_app_metric"
  entities  = [var.apm_entity]

  condition_scope = "application"
  metric          = "throughput_web"

  term {
    duration      = var.duration_throughput
    operator      = var.operator_throughput
    priority      = var.priority_throughput
    threshold     = var.threshold_throughput
    time_function = var.time_function_throughput
  }
}

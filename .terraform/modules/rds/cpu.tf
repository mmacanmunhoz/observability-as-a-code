### SATURATION

resource "newrelic_nrql_alert_condition" "cpu_saturation" {

  for_each = {
    for monitoring, observability in local.rds_alerts_01 : monitoring => observability
    if observability.enable == true
  }

  policy_id                      = var.policy_channel
  type                           = "static"
  name                           = "cpu_saturation-${each.value.type_rds}"
  description                    = "cpu_saturation-${each.value.type_rds}"
  enabled                        = var.cpu_alerts_enable
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  expiration_duration            = each.value.expiration_duration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  aggregation_window             = each.value.aggregation_window

  nrql {
    query = "SELECT max(`aws.rds.CPUUtilization`) FROM Metric FACET `${each.value.type_rds}` WHERE `${each.value.type_rds}` = '${each.value.name}'"
  }


  lifecycle {
    ignore_changes = [
      aggregation_delay,
      aggregation_method
    ]
  }


  critical {
    operator              = var.operator_cpu_saturation
    threshold             = var.threshold_cpu_saturation
    threshold_duration    = var.cpu_saturation_duration
    threshold_occurrences = var.time_function_cpu_saturation
  }

}

### AVERAGE

resource "newrelic_nrql_alert_condition" "cpu_average" {

  for_each = {
    for monitoring, observability in local.rds_alerts_01 : monitoring => observability
    if observability.enable == true
  }

  policy_id                      = var.policy_channel
  type                           = "static"
  name                           = "cpu_average-${each.value.type_rds}"
  description                    = "cpu_average-${each.value.type_rds}"
  enabled                        = var.cpu_alerts_enable
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  expiration_duration            = each.value.expiration_duration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  aggregation_window             = each.value.aggregation_window

  nrql {
    query = "SELECT average(`aws.rds.CPUUtilization`) FROM Metric FACET `${each.value.type_rds}` WHERE `${each.value.type_rds}` = '${each.value.name}'"
  }


  lifecycle {
    ignore_changes = [
      aggregation_delay,
      aggregation_method
    ]
  }


  critical {
    operator              = var.operator_cpu_average
    threshold             = var.threshold_cpu_average
    threshold_duration    = var.cpu_average_duration
    threshold_occurrences = var.time_function_cpu_average
  }

}
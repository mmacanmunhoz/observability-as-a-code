# module "aws_integration" {
#   source                        = "./modules/aws_new_relic_integration"
#   NEW_RELIC_ACCOUNT_ID          = ""
#   NEW_RELIC_CLOUDWATCH_ENDPOINT = "https://aws-api.newrelic.com/cloudwatch-metrics/v1"
#   NEW_RELIC_ACCOUNT_NAME        = ""

# }

# resource "newrelic_infra_alert_condition" "high_db_conn_count" {
#   policy_id = module.ops_engine_alert_channel.policy_channel

#   name                 = "High database connection count"
#   description          = "Critical alert when the number of database connections goes above 90"
#   type                 = "infra_metric"
#   select               = "provider.cpuUtilization.Average"
#   comparison           = "above"
#   where                = "(hostname LIKE '%db%')"
#   integration_provider = "RdsDbInstance"

#   critical {
#     duration      = 25
#     value         = 90
#     time_function = "all"
#   }
# }



locals {
  rds_alerts_01 = {
    "01" = {
      type_rds                       = "aws.rds.DBInstanceIdentifier"
      violation_time_limit_seconds   = 86400
      expiration_duration            = 300
      close_violations_on_expiration = true
      aggregation_window             = 60
      enable                         = true
      name                           = var.rds_name_instance
    },
    "02" = {
      type_rds                       = "aws.rds.dbClusterIdentifier"
      violation_time_limit_seconds   = 86400
      expiration_duration            = 300
      close_violations_on_expiration = true
      aggregation_window             = 60
      enable                         = true
      name                           = var.rds_name
    }
  }
}






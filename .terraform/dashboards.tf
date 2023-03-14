### DASHBOARDS

module "dashboards" {
  source         = "./modules/dashboards"
  name_dashboard = "keycloack-prd"
  account_id     = var.new_relic_account
  app_name       = "at-keycloak-prd"
  another_query  = local.add_dashboard

}
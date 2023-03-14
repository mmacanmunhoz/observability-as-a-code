data "newrelic_entity" "app" {
  name   = "at-keycloak-prd"
  type   = "APPLICATION"
  domain = "APM"
}



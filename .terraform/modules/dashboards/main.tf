terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.15.0"
    }
  }
}


resource "newrelic_one_dashboard" "this" {
  name        = var.name_dashboard
  permissions = var.permission

  page {
    name = var.name_dashboard


    dynamic "widget_line" {
      for_each = var.another_query
      iterator = item

      content {
        title  = item.value.title
        row    = item.value.row
        column = item.value.column
        width  = item.value.width
        height = item.value.height
        nrql_query {
          account_id = var.account_id
          query      = item.value.query
        }
      }
    }

    widget_line {
      title  = "Web throughput"
      row    = 1
      column = 1
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT rate(count(apm.service.transaction.duration), 1 minute) as 'Web throughput' FROM Metric WHERE (appName = '${var.app_name}') AND (transactionType = 'Web') TIMESERIES"
      }
    }

    widget_line {
      title  = "Apdex"
      row    = 1
      column = 7
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT apdex(apm.service.apdex) as 'App server', apdex(apm.service.apdex.user) as 'End user' FROM Metric WHERE ( appName = '${var.app_name}') TIMESERIES"
      }
    }

    widget_line {
      title  = "Transaction Time"
      row    = 4
      column = 7
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT filter(average(apm.service.overview.web * 1000), WHERE segmentName like 'Java') as 'Java' FROM Metric WHERE (appName = '${var.app_name}') TIMESERIES"
      }
    }

    widget_line {
      title  = "Container CPU Utilization"
      row    = 4
      column = 1
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT rate(sum(apm.service.cpu.usertime.utilization), 1 second) * 100 as cpuUsage FROM Metric WHERE (appName = '${var.app_name}') FACET `host` TIMESERIES"
      }
    }

    widget_line {
      title  = "Container Memory Utilization"
      row    = 8
      column = 1
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT (average(apm.service.memory.physical) * rate(count(apm.service.instance.count), 1 minute)) / 1000 as memoryUsage FROM Metric WHERE (appName = '${var.app_name}') FACET `host` TIMESERIES"
      }
    }

    widget_line {
      title  = "Error Rate"
      row    = 8
      column = 7
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT count(apm.service.error.count) / count(apm.service.transaction.duration) as 'Error rate' FROM Metric WHERE (appName = '${var.app_name}') TIMESERIES"
      }
    }

    widget_line {
      title  = "Top Database Operations"
      row    = 12
      column = 1
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT average(apm.service.datastore.operation.duration * 1000) FROM Metric WHERE (appName = '${var.app_name}') FACET `datastoreType`, `table`, `operation` LIMIT 5 TIMESERIES"
      }
    }

    widget_line {
      title  = "Errors Count"
      row    = 12
      column = 7
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT count(*) FROM TransactionError WHERE (appName = '${var.app_name}') AND (`error.expected` IS FALSE OR `error.expected` IS NULL)"
      }
    }

    widget_line {
      title  = "Response Status"
      row    = 16
      column = 1
      width  = 6
      height = 3
      nrql_query {
        account_id = var.account_id
        query      = "SELECT rate(count(*), 1 minute) AS 'Requests per minute' FROM Transaction WHERE appName = '${var.app_name}' FACET `response.status` LIMIT 10 TIMESERIES"
      }
    }
  }
}









# resource "newrelic_one_dashboard" "this" {
#   name        = var.name_dashboard
#   permissions = var.permission

#   page {
#     name = var.name_dashboard

#     dynamic "widget_line" {
#       for_each = local.dashboards_line
#       iterator = item

#       content {
#         title  = item.value.title
#         row    = item.value.row
#         column = item.value.column
#         width  = item.value.width
#         height = item.value.height
#         nrql_query {
#           account_id = var.account_id
#           query      = item.value.query
#         }
#       }
#     }
#   }
# }



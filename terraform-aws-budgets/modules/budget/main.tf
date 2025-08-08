locals {
  # First day of the current month at 00:00 UTC
  default_time_period_start = formatdate("YYYY-MM-01_00:00", timestamp())
}


resource "aws_budgets_budget" "this" {
  for_each = var.budgets
  name     = each.key

  budget_type  = each.value.budget_type
  time_unit    = each.value.time_unit
  limit_unit   = each.value.limit_unit
  limit_amount = each.value.amount
  dynamic "cost_filter" {
  for_each = try(each.value.cost_filters, {})
  content {
    name   = cost_filter.key
    values = cost_filter.value
  }
}


  # REQUIRED BY PROVIDER:
  time_period_start = coalesce(try(each.value.time_period_start, null), local.default_time_period_start)

  # FORECASTED notifications ...
  dynamic "notification" {
    for_each = toset(each.value.thresholds)
    content {
      comparison_operator        = "GREATER_THAN"
      threshold                  = notification.value
      threshold_type             = each.value.threshold_type
      notification_type          = "FORECASTED"
      subscriber_email_addresses = each.value.emails
      subscriber_sns_topic_arns  = try(each.value.sns_topic_arns, null)
    }
  }

  # ACTUAL notifications ...
  dynamic "notification" {
    for_each = var.include_actuals ? toset(each.value.actual_thresholds) : []
    content {
      comparison_operator        = "GREATER_THAN"
      threshold                  = notification.value
      threshold_type             = each.value.threshold_type
      notification_type          = "ACTUAL"
      subscriber_email_addresses = each.value.emails
      subscriber_sns_topic_arns  = try(each.value.sns_topic_arns, null)
    }
  }
}



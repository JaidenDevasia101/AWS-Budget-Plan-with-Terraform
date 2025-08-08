variable "budgets" {
  description = "Map of budgets to create"
  type = map(object({
    amount : number
    time_unit : string
    limit_unit : string
    budget_type : string
    thresholds : list(number)
    actual_thresholds : list(number)
    threshold_type : string
    emails : list(string)
    sns_topic_arns : optional(list(string), [])
    cost_filters : optional(map(list(string)), {})
    time_period_start : optional(string) # optional override per budget
  }))
}

variable "include_actuals" {
  description = "Whether to include ACTUAL notifications"
  type        = bool
  default     = true
}


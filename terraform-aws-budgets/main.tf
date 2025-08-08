module "budgets" {
  source          = "./modules/budget"
  budgets         = var.budgets
  include_actuals = var.include_actuals
}

variable "budgets" {
  description = "See modules/budget/variables.tf for schema"
  type = map(object({
    amount : number
    time_unit : string
    limit_unit : string
    budget_type : string
    thresholds : list(number)
    actual_thresholds : list(number)
    threshold_type : string
    emails : list(string)
    sns_topic_arns : optional(list(string))
    cost_filters : optional(map(list(string)))
  }))
}

variable "include_actuals" {
  type    = bool
  default = true
}

output "budget_names" {
  value = module.budgets.budget_names
}

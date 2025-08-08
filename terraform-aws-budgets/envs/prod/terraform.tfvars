region = "us-east-1"

budgets = {
  "prod-monthly" = {
    amount            = 150
    time_unit         = "MONTHLY"
    limit_unit        = "USD"
    budget_type       = "COST"
    thresholds        = [50, 75, 90, 100]
    actual_thresholds = [50, 75, 90, 100]
    threshold_type    = "PERCENTAGE"
    emails            = ["you+finops@example.com", "you+ops@example.com"]
    cost_filters = {
      Service = ["AmazonEC2", "AmazonRDS"]
      Region  = ["us-east-1"]
    }
  }
}

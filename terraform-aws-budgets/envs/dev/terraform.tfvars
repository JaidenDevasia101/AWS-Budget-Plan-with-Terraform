region = "us-east-1"

budgets = {
  "dev-monthly" = {
    amount            = 100
    time_unit         = "MONTHLY"
    limit_unit        = "USD"
    budget_type       = "COST"
    thresholds        = [50, 80, 100]
    actual_thresholds = [50, 80, 100]
    threshold_type    = "PERCENTAGE"
    emails            = ["you+dev@example.com"]
    cost_filters = {
      Service = ["AmazonEC2", "AmazonS3"]
    }
  }
}

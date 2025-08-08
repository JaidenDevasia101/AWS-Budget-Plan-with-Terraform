output "budget_names" {
  value = [for k, _ in var.budgets : k]
}

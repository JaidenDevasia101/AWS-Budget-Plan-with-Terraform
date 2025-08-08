# Terraform AWS Budgets Module

A reusable Terraform module that creates and manages AWS Budgets for cost control and forecasting.  
Supports multiple budgets, ACTUAL and FORECASTED notifications, email/SNS alerts, and fine-grained cost filters.

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)

## What this Budgets Module Solves

Cloud cost overruns are common — especially in multi-team AWS accounts.  
This module automates AWS Budget creation so organizations can:

- Set cost or usage limits
- Send proactive alerts before hitting thresholds
- Scope budgets to specific services, regions, or tagged resources
- Standardize budget deployment across multiple environments

## Features

- **Multiple Budgets** — Deploy many budgets in one Terraform run using `for_each`.
- **Customizable Thresholds** — Supports ACTUAL and FORECASTED percentage or absolute limits.
- **Email & SNS Notifications** — Send alerts to individuals, teams, or Slack via Lambda integration.
- **Cost Filters** — Restrict budgets by Service, Region, Linked Account, or Cost Allocation Tags.
- **Environment Ready** — Separate `dev` and `prod` configurations for safe rollouts.
- **Reusable Module** — Drop into any AWS account and configure via `.tfvars` files.

## Visual Mapping

Terraform Code  →  AWS Budgets API  →  Budget(s) Created
                              ↳ Notifications → Email / SNS

## Skills Demonstrated

- **Infrastructure as Code (IaC)** — Modular Terraform design with variables, outputs, and `for_each`.
- **AWS Budget Management** — Automating cost governance at scale.
- **Environment Segregation** — Separate `dev` and `prod` state and configurations.
- **Dynamic Blocks** — Advanced Terraform looping to generate multiple notifications and cost filters.
- **Reusable Modules** — Designed for easy drop-in to any AWS project.
- Add AWS Budgets Actions (e.g., automatically detach policies when threshold hit)
- Include Infracost integration for PR cost diffs
- Add optional Slack alert integration

## Getting Started

### Prerequisites
- Terraform >= 1.6
- AWS CLI configured with `budgets:*` and `sns:Publish` permissions

### Quick Deploy

```bash
git clone https://github.com/<your-username>/terraform-aws-budgets.git
cd terraform-aws-budgets

terraform init
terraform plan -var-file=envs/dev/terraform.tfvars
terraform apply -var-file=envs/dev/terraform.tfvars


---

### **. Example `tfvars`**
```md
## Example: envs/dev/terraform.tfvars
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
    emails            = ["devops@example.com"]
    cost_filters      = { Service = ["AmazonEC2", "AmazonS3"] }
  }
}

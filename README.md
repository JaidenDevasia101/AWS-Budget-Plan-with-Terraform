# Terraform AWS Budgets Module

A reusable Terraform module that creates and manages AWS Budgets for cost control and forecasting.  
Supports multiple budgets, ACTUAL and FORECASTED notifications, email/SNS alerts, and fine-grained cost filters.

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)

## Why this project exists

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

Terraform Code  →  AWS Budgets API  →  Budget(s) Created
                              ↳ Notifications → Email / SNS

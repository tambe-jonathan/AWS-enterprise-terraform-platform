# Terraform-enterprise-cloud-platform
This repository contains production-grade Terraform modules to provision a secure, highly available, and scalable 3-tier architecture on AWS. It includes networking, EKS clusters, RDS databases, IAM roles, and ALB configurations. Designed to serve as a platform reference for deploying any enterprise-grade applications.

 ## Project structure 
```
terraform-aws-enterprise-stack/
├── .github/
│   └── workflows/
│       ├── tf-plan.yml            # CI: Validates code & runs 'plan' on Pull Requests
│       └── tf-apply.yml           # CD: Deploys to AWS on Merge to Main
├── bootstrap/                     # THE "STEP 0" (Run once manually)
│   ├── main.tf                    # Creates S3 Bucket & DynamoDB for Remote State
│   ├── outputs.tf
│   └── variables.tf
├── modules/                       # REUSABLE LEGO BRICKS (Generic & Clean)
│   ├── vpc/
│   │   ├── main.tf                # VPC, Subnets, IGW, NAT, Flow Logs
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── security/
│   │   ├── main.tf                # Security Groups & WAF Rules
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── compute/
│   │   ├── main.tf                # ASG, Launch Templates, IAM Instance Profiles
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── load_balancer/
│   │   ├── main.tf                # ALB, Listeners, Target Groups
│   │   └── outputs.tf
│   └── rds/
│       ├── main.tf                # Aurora or RDS Instance (Multi-AZ)
│       └── variables.tf
├── environments/                  # LIVE DEPLOYMENTS (Where the magic happens)
│   ├── prod/
│   │   ├── backend.tf             # Points to the S3 bucket from 'bootstrap'
│   │   ├── main.tf                # MODULE COMPOSITION (Calls the modules above)
│   │   ├── outputs.tf             # High-level outputs (ALB DNS Name)
│   │   ├── terraform.tfvars       # Production-specific values (e.g., t3.medium)
│   │   └── variables.tf
│   └── staging/                   # (Optional) Same as prod but with t3.micro
├── scripts/                       # TOOLING
│   ├── check-format.sh            # Pre-commit hook to run 'terraform fmt'
│   └── cleanup-leaked-keys.py     # Shows security-mindedness
└── README.md                      # YOUR RESUME (Architecture diagrams & Docs)
```
## 

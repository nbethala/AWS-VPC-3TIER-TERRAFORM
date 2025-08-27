# 🌐 3-Tier AWS VPC Architecture with Terraform

This project provisions a modular, cost-aware 3-tier VPC architecture using Terraform. It demonstrates infrastructure automation, reproducibility, and secure cloud design.
## 📐 Architecture Overview

The VPC is structured into three tiers across multiple Availability Zones:

- **Public Tier**: Internet Gateway, NAT Gateway, public subnets
- **Application Tier**: Private subnets for ECS/EC2 workloads
- **Data Tier**: Isolated private subnets for RDS or persistent storage

Each tier is designed for high availability, security, and future extensibility.

![VPC Architecture Diagram](diagrams/vpc-architecture.png)

## 🚀 Features

- ✅ Modular Terraform structure (`modules/vpc`, `modules/iam`, etc.)
- ✅ Automated resource tagging and cleanup
- ✅ Cost-aware design (e.g., single NAT Gateway per AZ)
- ✅ IAM bootstrap strategy for new AWS accounts
- ✅ Visual documentation and architecture diagrams
- ✅ Reproducible infrastructure via version-controlled code

## 🛠️ Technologies Used

- **Terraform**: Infrastructure as Code
- **AWS**: VPC, Subnets, IGW, NAT, Route Tables, Security Groups
- **Packer**: AMI creation (optional)
- **ECR**: Container image registry (optional)
- **VS Code Tasks**: Streamlined Terraform workflow

- ## ✅ VPC Validation Summary

- Verified subnet distribution across AZs
- Confirmed route table associations and IGW/NAT routing
- Attached screenshots in `diagrams/`
- Documented validation steps in `docs/validation.md`


## 📁 Project Structure

```bash
├── modules/
│   ├── vpc/
│   ├── iam-policy-terraform-admin/
│   └── ...
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── diagrams/
    └── vpc-architecture.png

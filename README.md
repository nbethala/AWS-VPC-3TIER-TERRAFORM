# 🌐 AWS 3-Tier VPC Architecture with Terraform  

This project provisions a modular, cost-aware 3-tier VPC architecture using Terraform. It demonstrates infrastructure automation, reproducibility, and secure cloud design.

##  Why This Project?

As a Cloud Operations Engineer relaunching my career, I built this project to demonstrate:

- **Scalable, secure cloud architecture** using Terraform and AWS best practices
- **Reproducible infrastructure** with modular code and automated cleanup
- **Cost-aware design** that reflects real-world resource management
- **Clear documentation and visual storytelling** for recruiter visibility and future handoff

## 📐 Architecture Overview
The VPC is structured into three tiers across multiple Availability Zones:

- **Public Tier**: Internet Gateway, NAT Gateway, public subnets
- **Application Tier**: Private subnets for ECS/EC2 workloads
- **Data Tier**: Isolated private subnets for RDS or persistent storage

Each tier is designed for high availability, security, and future extensibility.

![AWS-architecture-diagram](https://github.com/user-attachments/assets/b8bce646-8b8c-4d00-801e-a5ff2dc78a1a)
ecture.png)

##  Features

- ✅ Modular Terraform structure (`modules/vpc`, `modules/iam`, etc.)
- ✅ Automated resource tagging and cleanup
- ✅ Cost-aware design (e.g., single NAT Gateway per AZ)
- ✅ IAM bootstrap strategy for new AWS accounts
- ✅ Visual documentation and architecture diagrams
- ✅ Reproducible infrastructure via version-controlled code

##  Architecture & Layout
This project follows a modular Terraform structure to support scalable, secure, and reproducible infrastructure. Key components include:

###  High-Level Architecture
- **VPC** with public, private, and database subnets across multiple availability zones
- **Internet Gateway** and **NAT Gateway** for controlled outbound access
- **Route Tables** scoped to subnet tiers
- **Security Groups** for layered access control
- **IAM Roles & Policies** with least-privilege principles
- **ECR Integration** for containerized workloads

##  Getting Started
This project is deployed by completing the following steps, designed to reflect real-world infrastructure workflows and portfolio-ready reproducibility:

###  Terraform Setup
- Install [Terraform](https://www.terraform.io/downloads) and configure your local environment
- Initialize your working directory with `terraform init`
- Understand and use core commands: `terraform plan`, `apply`, and `destroy`

###  Remote Backend Configuration
- Create an S3 bucket in AWS to store Terraform state remotely
- Configure `backend.tf` to enable state locking and collaboration

### Optional Tooling for Ease of Use
- Set up a GitHub profile and repository to version control your code
- Install [Git](https://git-scm.com/), [Visual Studio Code](https://code.visualstudio.com/), and [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

###  Writing Terraform Code to Deploy AWS Resources
- Define input variables and outputs for flexible, composable modules
- Create a VPC with public/private subnets across multiple Availability Zones
- Provision NAT Gateways for secure outbound traffic
- Define Security Groups for layered access control
- Launch an RDS instance for database tier
- Deploy EC2 instances for application tier
- Configure Application Load Balancers and Auto Scaling Groups
- Set up Route 53 record sets and AWS Certificate Manager for DNS and HTTPS

### Cleanup & Cost Control
- Use `terraform destroy` and custom cleanup scripts to remove resources
- Validate that no residual infrastructure remains to avoid unnecessary charges


 ## VPC Validation & testing
- Verified subnet distribution across AZs
- Confirmed route table associations and IGW/NAT routing
- Attached screenshots in `diagrams/`
- Documented validation steps in `docs/validation.md`


##  Project Structure

```bash
├── modules/
│   ├── vpc/
│   ├── iam-policy-terraform-admin/
│   └── iam-policy-vpc-admin
├── main.tf
├── variables.tf
├── outputs.tf
├── alb.tf
├── nat-gateway.tf
├── rds.tf
├── security-group.tf
├── vpc.tf
├── README.md
└── diagrams/
    └── vpc-architecture.png

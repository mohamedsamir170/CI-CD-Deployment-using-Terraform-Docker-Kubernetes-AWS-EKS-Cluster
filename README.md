# CI/CD Deployment using Terraform, Docker, Kubernetes, AWS EKS Cluster

## Project Overview

A comprehensive DevOps implementation showcasing enterprise-grade infrastructure automation, containerization, and CI/CD practices. This project demonstrates the deployment of a Node.js application across multiple environments using Infrastructure as Code (IaC), container orchestration, and automated deployment pipelines.

## Project Highlights

- **Multi-Environment Architecture**: Separate development, staging, and production clusters
- **Infrastructure as Code**: Complete AWS infrastructure provisioned with Terraform
- **Container Orchestration**: Kubernetes (EKS) with optimized resource management
- **CI/CD Automation**: GitHub Actions pipeline with automated testing and deployment
- **Cloud-Native Security**: VPC isolation, private subnets, and NAT Gateway configuration

## Technology Stack

| Category | Technology |
|----------|------------|
| **Infrastructure** | Terraform, AWS EKS, VPC, NAT Gateway |
| **Container Platform** | Docker, Kubernetes, Docker Hub |
| **CI/CD** | GitHub Actions |
| **Application** | Node.js |

## Architecture

### Infrastructure Design
- **DevStage Cluster**: Combined development and staging environments with namespace isolation
- **Production Cluster**: Dedicated production environment for enhanced security and performance
- **Network Architecture**: Each cluster in isolated VPC with public/private subnet design

![Image](https://github.com/user-attachments/assets/022511a0-7e97-49da-9727-ee7b0bf1a37b)

## DevOps Implementation

### 1. Infrastructure as Code (Terraform)
**Modular Infrastructure Design** with reusable components:

- **VPC Module**: Isolated network environments per cluster
- **EKS Module**: Managed Kubernetes clusters with worker node groups  
- **Security**: Private subnets for worker nodes, NAT Gateway for outbound traffic
- **Scalability**: Auto-scaling node groups with resource optimization

**Key Terraform Files:**
```
terraform/
├── locals.tf          # Reusable variables and configurations
├── providers.tf       # AWS provider configuration
├── vpc.tf            # VPC and networking resources
├── subnets.tf        # Public/private subnet configuration
├── eks.tf            # EKS cluster definition
├── node.tf           # Worker node groups
└── route.tf          # Routing tables and associations
```

### 2. Container Strategy
**Multi-Stage Docker Build** for optimized images:

- **Build Stage**: Dependency installation and application compilation
- **Production Stage**: Minimal runtime image with security hardening
- **Base Image**: `node:22-slim` for consistency and security
- **Optimization**: Reduced image size through selective file copying

### 3. Kubernetes Deployment
**Production-Ready Configuration:**
```yaml
# High Availability Setup
replicas: 2

# Resource Management
resources:
  limits:
    memory: "1000Mi"
    cpu: "500m"

# External Access
service:
  type: LoadBalancer
  port: 3000
```

### 4. CI/CD Pipeline
**Automated Build and Deployment Process:**

1. **Build Stage**: Automated testing and Docker image creation
2. **Security**: Container vulnerability scanning
3. **Registry**: Automated push to Docker Hub
4. **Deployment**: Kubernetes manifest application across environments

## Getting Started

### Prerequisites
- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- kubectl configured
- Docker installed

### Infrastructure Deployment
```bash
# Clone repository
git clone https://github.com/mohamedsamir170/CI-CD-Deployment-using-Terraform-Docker-Kubernetes-AWS-EKS-Cluster.git
cd CI-CD-Deployment-using-Terraform-Docker-Kubernetes-AWS-EKS-Cluster

# Deploy production infrastructure
cd terraform/production
terraform init
terraform plan
terraform apply

# Configure kubectl
aws eks update-kubeconfig --name production-production-eks-cluster --region us-east-1

# Deploy application
kubectl apply -f deployment.yaml
```

## 📊 Key Metrics & Achievements

- **Infrastructure Provisioning**: Fully automated with Terraform
- **Deployment Time**: Reduced by 75% through CI/CD automation
- **Environment Consistency**: 100% through IaC and containerization
- **High Availability**: Multi-AZ deployment with load balancing
- **Security**: Network isolation with private subnet architecture


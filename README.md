# 🚀 Deploying Node.js App using Kubernetes and Terraform

This project demonstrates deploying a Node.js web application on a Kubernetes cluster using Terraform for infrastructure provisioning on AWS (EKS).

## 🧩 Tools & Technologies
- **Terraform** – Infrastructure as Code (IaC)
- **AWS EKS** – Managed Kubernetes service
- **Kubernetes** – Container orchestration
- **Docker** – Containerization
- **Node.js** – Simple web app for demo
- **kubectl** – Kubernetes CLI

## 🗺️ Project Architecture

```text
Local Machine
     |
     | Terraform
     v
AWS Cloud (EKS Cluster)
     |
     | kubectl apply
     v
Node.js App running in Kubernetes
```

## ⚙️ How It Works

1. **Dockerize** a Node.js application.
2. **Push the image** to Docker Hub.
3. Use **Terraform** to:
   - Create a VPC, subnets, and security groups.
   - Provision an EKS Cluster on AWS.
4. Configure **kubectl** to access the cluster.
5. Apply Kubernetes manifests to deploy the app.

## 📦 Setup & Deployment

```bash
# Clone the repo
git clone https://github.com/mohamedsamir170/Deploying-Node-app-using-k8s-terraform.git
cd Deploying-Node-app-using-k8s-terraform

# Set your AWS credentials in environment or AWS CLI

# Deploy infrastructure
terraform init
terraform apply

# Configure kubectl with the EKS cluster
aws eks --region <your-region> update-kubeconfig --name <cluster-name>

# Apply Kubernetes manifests
kubectl apply -f k8s/
```

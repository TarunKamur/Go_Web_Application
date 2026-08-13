# Go Web Application — Production-Style Jenkins CI/CD

A production-style Go web application demonstrating a modern DevOps workflow using **GitHub, Jenkins, Docker, Docker Registry, Kubernetes/K3s, NGINX Ingress, Helm, and security scanning tools**.

This project demonstrates an end-to-end **Continuous Integration and Continuous Delivery pipeline** with a Jenkins Controller and containerized Jenkins Agent.

---

## 🚀 Project Overview

The application is a simple Go web application built using Go's standard `net/http` package.

The project demonstrates:

- GitHub source control
- Jenkins Controller
- Containerized Jenkins Agent
- Jenkins Pipeline as Code
- Go application build and testing
- Docker image creation
- Docker Hub / Harbor image registry
- Gosec security scanning
- Gitleaks secret scanning
- Trivy container image scanning
- Kubernetes deployment
- K3s single-node cluster
- Kubernetes Service
- NGINX Ingress Controller
- Helm deployment
- Rolling updates
- Deployment verification
- CI → CD automation

---

# 🏗️ Architecture

```text
                         GitHub
                            │
                            │ Push / PR
                            ▼
                  ┌─────────────────────┐
                  │   Jenkins Controller │
                  │                     │
                  │ Pipeline Orchestration
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │ Jenkins Container     │
                  │ Agent                 │
                  │                      │
                  │ Go                   │
                  │ Docker CLI           │
                  │ kubectl              │
                  │ Helm                 │
                  │ Trivy                │
                  │ Gosec                │
                  │ Gitleaks             │
                  └──────────┬───────────┘
                             │
              ┌──────────────┴──────────────┐
              │                             │
              ▼                             ▼
         CI Pipeline                   CD Pipeline
              │                             │
              ├── Checkout                  ├── Checkout
              ├── Go Test                   ├── Kubeconfig
              ├── Gosec                     ├── Update Image
              ├── Gitleaks                  ├── kubectl apply
              ├── Go Build                  ├── Rollout Status
              ├── Docker Build              └── Verify
              ├── Trivy
              └── Push Image
                     │
                     ▼
              Docker Hub / Harbor
                     │
                     ▼
                  K3s Cluster
                     │
              ┌──────┴──────┐
              │             │
              ▼             ▼
          Deployment      Service
              │             │
              └──────┬──────┘
                     ▼
               NGINX Ingress
                     │
                     ▼
              Go Web Application


🔄 End-to-End CI/CD Flow


Developer
    │
    ▼
GitHub
    │
    ▼
Jenkins CI
    │
    ├── Checkout
    ├── Dependencies
    ├── Unit Tests
    ├── Gosec
    ├── Gitleaks
    ├── Go Build
    ├── Docker Build
    ├── Trivy Scan
    └── Push Image
            │
            │ CI SUCCESS
            ▼
       CD Pipeline
            │
            ├── Checkout Kubernetes Manifests
            ├── Configure Kubeconfig
            ├── Update Image Tag
            ├── kubectl apply
            ├── Rollout Status
            └── Verify Deployment
                    │
                    ▼
                K3s Cluster
                    │
                    ▼
              Go Web Application


🛠️ Technology Stack
Application
Go
net/http
HTML/CSS
Source Control
Git
GitHub
CI/CD
Jenkins
Jenkins Pipeline
Jenkins Controller
Jenkins Container Agent
Containerization
Docker
Container Registry
Docker Hub
Harbor
Security
Gosec
Gitleaks
Trivy
Kubernetes
Kubernetes
K3s
kubectl
Helm
NGINX Ingress Controller
Future Production Enhancements
Terraform
AWS EKS
Argo CD
GitOps
Prometheus
Grafana
OpenTelemetry
Loki / ELK
Argo Rollouts
Canary Deployment
Blue-Green Deployment              

              

[![Build and Push Docker image](https://github.com/EzioDEVio/GitOps-ArgoCD-App/actions/workflows/build.yml/badge.svg)](https://github.com/EzioDEVio/GitOps-ArgoCD-App/actions/workflows/build.yml)
# Node.js Application Deployment with ArgoCD and GitOps 🚀

This repository contains the source code and Kubernetes deployment configurations for a simple Node.js application. This project demonstrates a GitOps workflow using ArgoCD to manage deployments automatically in a Kubernetes cluster.

## 📋 Overview

The Node.js application is a simple web server that is containerized with Docker and deployed to a Kubernetes cluster. The deployment process is managed through ArgoCD, which continuously monitors this repository for changes and applies them to the cluster based on the GitOps principles.

## 🛠️ Prerequisites

Before you start, ensure you have the following installed:
- Docker
- Kubernetes
- kubectl
- ArgoCD CLI

## 🖥️ Local Development

To run the Node.js application locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the application**:
   ```bash
   npm start
   ```

   This will start the Node.js server on `http://localhost:3000`.

## 🐳 Dockerization

The application is Dockerized with a Dockerfile in the root of the repository. To build the Docker image, run:

```bash
docker build -t your-username/your-app:latest .
```

To run the application using Docker:

```bash
docker run -p 3000:3000 your-username/your-app:latest
```

## 🚢 Deployment to Kubernetes

The Kubernetes manifests in the `deployments/` directory define the necessary resources for deploying this application to a Kubernetes cluster.

1. **Applying Kubernetes Manifests Manually** (not recommended for GitOps workflow):

   ```bash
   kubectl apply -f deployments/
   ```

2. **Using ArgoCD**:

   - Set up ArgoCD in your cluster.
   - Create an application in ArgoCD that tracks this repository.
   - Make changes to the manifests or Docker image, push them to your repository, and watch ArgoCD automatically synchronize the changes.

## 🔍 Monitoring with ArgoCD

You can monitor and manage the application through the ArgoCD dashboard:

1. **Access the Dashboard**:
   Forward the ArgoCD server port to your local machine:

   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:443
   ```

   Then visit `https://localhost:8080` in your browser.

2. **Login Details**:
   Use the default username `admin` and get the password using:

   ```bash
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
   ```

3. **View the Application Status**:
   Check the sync status, health, and more in the ArgoCD dashboard.

## 🤝 Contributing

Contributions are welcome! Feel free to open pull requests or issues to improve the application or deployment configurations.

## 📖 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


### Additional Notes

- **Customization**: You may need to replace placeholders (like `your-username/your-repo`) with actual values relevant to your project.
- **Repository Links**: Adjust links to match the actual URLs where your code and Docker images are hosted.
- **ArgoCD Configuration Details**: This README assumes ArgoCD is already configured and operational within the cluster. If this is not the case, you might need to include setup details or refer to official ArgoCD documentation for initial setup instructions.

This README.md provides a comprehensive guide that not only helps users understand how to get the application running but also how to manage deployments through a GitOps workflow using ArgoCD.

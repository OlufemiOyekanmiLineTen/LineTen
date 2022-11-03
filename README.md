<b>The Hello LineTen App </b>

This project contains a simple Hello World application built with Python.

The application is synced with Azure Devops in which a build is triggered when there's an update to the main branch.

The Azure Pipleine contains three stages
- The Infrastructure stage 
- The Build docker stage
- The Deploy to Kubernetes stage

1. The Infrastructure stage - The Infrastruture is built with terraform. It contains a series of terraform files which builds an AKS cluster, a container registry.
2. The Build stage - In this stage, the pipeline builds the application using its Dockerfile and is deployed to ACR
3. The Deploy to Kuberenets stage - In this stage, the image is pulled from the ACR and deployed into the Kubernetes cluster

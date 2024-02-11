# K8s Demo README

This repository contains Kubernetes manifests for deploying a simple web application connected to a MongoDB database. The project consists of several YAML files and a shell script to streamline the deployment process.

## Files in the Project

### 1. `mongo-config.yml`

This file defines a ConfigMap named `mongo-config`, which holds configuration data for the MongoDB deployment. Specifically, it sets the MongoDB connection URL to `mongo-service`.

### 2. `mongo-secret.yml`

This YAML file defines a Secret named `mongo-secret`. It contains base64-encoded values for the MongoDB username and password. Make sure to update these values based on your requirements.

### 3. `mongo.yml`

This file defines a MongoDB Deployment and a corresponding Service. The Deployment ensures a single MongoDB instance is running, and the Service allows other components to communicate with it. The MongoDB image used is version 5.0.

### 4. `webapp.yml`

This YAML file defines a Deployment and a Service for the web application. The web application uses the image `nanajanashia/k8s-demo-app:v1.0` and connects to the MongoDB instance using the information provided in the `mongo-secret` and `mongo-config`.

### 5. `start.sh`

This shell script automates the deployment process. It includes commands to check the existing pods, apply the configuration files (`mongo-config.yml`, `mongo-secret.yml`, `mongo.yml`, and `webapp.yml`), and then display the updated list of pods and node information.

## Getting Started

1. Ensure you have a running Kubernetes cluster.
2. Clone this repository:

    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

3. Make sure to customize the values in `mongo-secret.yml` with your desired MongoDB username and password.

4. Run the deployment script:

    ```bash
    chmod +x start.sh
    ./start.sh
    ```

5. Monitor the deployment progress by checking the pods:

    ```bash
    kubectl get pod
    ```

6. After the deployment is complete, access the web application through the NodePort specified in `webapp.yml`.

    ```bash
    kubectl get node -o wide
    ```

   The NodePort should be accessible at `<Node_IP>:30100`, where `<Node_IP>` is the IP address of one of your cluster nodes.

Feel free to explore and customize the configurations based on your specific requirements.

# K8s Demo README

This repository contains Kubernetes manifests for deploying a simple web application connected to a MongoDB database. The project consists of several YAML files and a shell script to streamline the deployment process.
## Prerequisites

Before you begin, ensure you have the following installed:

- Kubernetes cluster
- kubectl CLI tool configured to communicate with your cluster

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
    git clone https://github.com/valiantlynx/k8s_demo.git
    cd k8s_demo
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

## Usage

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/valiantlynx/k8s_demo.git
cd k8s_demo
```

### Step 2: Deploy MongoDB

Apply the MongoDB configuration:

```bash
kubectl apply -f mongo-config.yml
kubectl apply -f mongo-secret.yml
kubectl apply -f mongo.yml
```

This will create a ConfigMap (`mongo-config`) for MongoDB configuration and a Secret (`mongo-secret`) for sensitive information like username and password.

### Step 3: Deploy the Web Application

Apply the web application configuration:

```bash
kubectl apply -f webapp.yml
```

This will deploy the web application with the necessary environment variables referencing the MongoDB Secret and ConfigMap.

### Step 4: Access the Application

After deploying the application, you can access it using the NodePort specified in `webapp.yml`. If you're using a local Kubernetes cluster (e.g., Minikube), you can access the application at `http://<minikube_ip>:30100`.

### Step 5: Verify Deployment

Check the status of the deployed pods:

```bash
kubectl get pods
```

Check the status of the deployed services:

```bash
kubectl get services
```

Check the status of the nodes in the cluster:

```bash
kubectl get nodes -o wide
```

## Cleaning Up

To remove the deployed resources, you can delete the Kubernetes objects:

```bash
kubectl delete -f mongo-config.yml
kubectl delete -f mongo-secret.yml
kubectl delete -f mongo.yml
kubectl delete -f webapp.yml
```

## Additional Notes

- The `start.sh` script provided in the repository simply performs basic Kubernetes commands to get pod information, apply configurations, and get node details. You can use it for reference or automation purposes.

Feel free to adjust the instructions or provide further details if needed!

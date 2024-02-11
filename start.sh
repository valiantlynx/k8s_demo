#!/bin/bash

# Display the existing pods in the Kubernetes cluster
kubectl get pod

# Pause for 3 seconds to allow time for the user to review the current pod status
sleep 3

# Apply the configuration for MongoDB ConfigMap
kubectl apply -f mongo-config.yml

# Apply the configuration for MongoDB Secret
kubectl apply -f mongo-secret.yml

# Apply the configuration for MongoDB Deployment and Service
kubectl apply -f mongo.yml

# Apply the configuration for Web Application Deployment and Service
kubectl apply -f webapp.yml

# Display the updated list of pods after applying the configurations
kubectl get pod

# Pause for 3 seconds to allow time for the new pods to start
sleep 3

# Display node information including IP addresses (wide output)
kubectl get node -o wide

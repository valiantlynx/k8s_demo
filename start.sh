kubectl get pod 
sleep 3
kubectl apply -f mongo-config.yml
kubectl apply -f mongo-secret.yml
kubectl apply -f mongo.yml
kubectl apply -f webapp.yml
kubectl get pod
sleep 3
kubectl get node -o wide


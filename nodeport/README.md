##INSTALLION
````
kubectl create secret docker-registry regcred --docker-server=registry.9prints.com --docker-username=dangvanduc90 --docker-password=****** --docker-email=dangvanduc0@gmail.com

# start application
kubectl apply -f deploy.yml
kubectl apply -f service.yml
````

##UNINSTALLION
````
#kubectl delete -f deploy.yml
#kubectl delete -f service.yml
````


## DEBUG
````
# kubectl get events
# aws ec2 describe-vpcs
# aws ec2 describe-subnets
````

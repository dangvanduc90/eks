```

eksctl create cluster --name dls-9prints --region us-east-2 --version 1.24 --vpc-public-subnets subnet-0e05c75acad07b13a,subnet-0543a8627e620be84 --vpc-private-subnets subnet-05f5d5774792ffbf1,subnet-0c00a56f0b62b0bdb --without-nodegroup

eksctl create nodegroup --cluster dls-9prints --region us-east-2 --name dls-9prints-us-east --node-ami-family AmazonLinux2 --node-type t3.medium --nodes 2 --nodes-min 2 --nodes-max 4 --ssh-access --ssh-public-key eks

helm upgrade --install ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--namespace ingress-nginx --create-namespace

kubectl create secret docker-registry --namespace=ingress-nginx regcred --docker-server=registry.9prints.com --docker-username=dangvanduc90 --docker-password=****** --docker-email=dangvanduc0@gmail.com

# truy cập vào https://freessl.org/ để tạo ssl free 90 ngày, kiểu verify bằng dns, tạo bản ghi txt trong route53 để verify
# sau đó download về và để toàn bộ file vào trong thư mục ingress-nginx/freessl

kubectl create secret tls olongvien-tls --key freessl/olongvien.online.key --cert freessl/olongvien.online.pem -n ingress-nginx

kubectl apply -f service.yml

kubectl apply -f deploy.yaml

kubectl apply -f ingress.yaml



UNINSTALLION
# eksctl delete cluster dls-9prints



# DEBUG
# kubectl get events
# aws ec2 describe-vpcs
# aws ec2 describe-subnets
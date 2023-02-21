
##INSTALLION
###VPC
1. tạo vpc
   1. edit vpc 
      1. Enable DNS resolution
      2. Enable DNS hostnames
2. tạo Internet gateways
   1. Attach to VPC vừa mới tạo ở trên
3. tạo 4 subnets, 2 private, 2 public
   1. đối với 2 public subnet
      1. Enable DNS hostnames
      2. Enable resource name DNS A record on launch 
4. Trong mục Endpoints
   1. Service chọn `com.amazonaws.us-east-2.s`
   2. VPC chọn VPC vừa mới tạo
5. tạo Route tables cho private subnet
   1. Edit routes
       1. Add route
           1. Destination -> 0.0.0.0/0
           2. Target -> Internet gateways vừa mới tạo
   2. Edit subnet associations
      1. Chọn 2 private subnet
6. Đối với Route tables mặc định khi tạo VPC
   1. Edit subnet associations
      1. Chọn 2 public subnet
7. Trong file ingress.yaml
   1. Thay subnet bằng 2 public subnet mới tạo
###EC2
1. Vào mục EC2, tạo key pairs tên là eks dạng pem
###DOCKER PRIVATE REGISTRY
1. Tạo access token
2. replace to --docker-password
###CERTIFICATE
1. Request public certificate 
2. Sau khi tạo certificate thì replace certificate-arn trong file ingress.yaml
```

# create stack VPC called my-eks-vpc by aws UI and associat to route table, make sure ticked 'Enable auto-assign public IPv4 address' and ticked 'Enable DNS hostnames' as well
# aws cloudformation delete-stack --stack-name my-eks-vpc
# aws cloudformation create-stack    --stack-name my-eks-vpc    --region us-east-2    --template-body file://amazon-eks-vpc-private-subnets.yaml

# replace your's private subnets and public subnets
eksctl create cluster --name dls-9prints --region us-east-2 --version 1.24 --vpc-public-subnets subnet-0e05c75acad07b13a,subnet-0543a8627e620be84 --vpc-private-subnets subnet-05f5d5774792ffbf1,subnet-0c00a56f0b62b0bdb --without-nodegroup

eksctl create nodegroup --cluster dls-9prints --region us-east-2 --name dls-9prints-us-east --node-ami-family AmazonLinux2 --node-type t3.medium --nodes 2 --nodes-min 2 --nodes-max 4 --ssh-access --ssh-public-key eks

kubectl create secret docker-registry regcred --docker-server=registry.9prints.com --docker-username=dangvanduc90 --docker-password=****** --docker-email=dangvanduc0@gmail.com


# start application
run command follow loadbalancer-controller.txt
kubectl apply -f manifest.yml
kubectl apply -f service.yml
kubectl apply -f ingress.yml



UNINSTALLION
# eksctl delete cluster dls-9prints



# DEBUG
# kubectl get events -n kube-system
sudo yum install unzip -y

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.9/2023-01-11/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp ./kubectl /bin/kubectl && export PATH=$PATH:/bin
kubectl version --short --client

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

wget "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
tar xzf "eksctl_$(uname -s)_amd64.tar.gz"
mv eksctl /usr/local/bin
eksctl version
kubectl apply -f ns-and-sa.yaml

kubectl create secret tls default-server-secret --key freessl/olongvien.online.key --cert freessl/olongvien.online.pem -n nginx-ingress

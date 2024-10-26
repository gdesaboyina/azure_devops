#!/bin/bash

curl -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 

chmod +x /usr/local/bin/kubectl

# check versions
kubectl version --client


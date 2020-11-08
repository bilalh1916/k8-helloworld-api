#!/bin/bash

#################################################################
# THIS SCRIPT WILL INSTALL REQUIRED PACKAGES AND CONFIGURATIONS #
#################################################################

### Function to install kubectl
Kube() {
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin
}
### Function to install heptio-authenticator-aws
Auth(){
    wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64
    chmod +x heptio-authenticator-aws_0.3.0_linux_amd64
    sudo mv heptio-authenticator-aws_0.3.0_linux_amd64 /usr/local/bin/heptio-authenticator-aws
}
### Function to install Terraform and run script
Tf() {
    wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
    unzip terraform_0.13.5_linux_amd64.zip
    rm -rf terraform_0.13.5_linux_amd64.zip
    mv terraform /usr/local/bin
   # terraform init
   # terraform apply
}

Kube
Auth
Tf

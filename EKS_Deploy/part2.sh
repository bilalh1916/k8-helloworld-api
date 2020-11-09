#/bin/bash

#################################################
# THIS SCRIPT WILL CONFIGURE KUBECTL & AWS AUTH #
#################################################

### Configure kubectl
Kubconf(){
    terraform output kubeconfig
    aws eks --region us-east-1 update-kubeconfig --name eks-cluster
}
### Configure aws-auth & verify cluster is running
Authconf(){
    terraform output config-map-aws-auth
    kubectl apply -f config-map-aws-auth.yaml
    kubectl get nodes|watch
}

Kubconf
Authconf
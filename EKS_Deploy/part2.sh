#/bin/bash

######################################################################
# THIS SCRIPT WILL CONFIGURE KUBECTL & AWS AUTH AND DEPLOY CONTAINER #
######################################################################

### Configure kubectl
Kubconf(){
    terraform output kubeconfig
    aws eks --region us-east-1 update-kubeconfig --name eks-cluster
}
### Configure aws-auth & verify cluster is running
Authconf(){
    terraform output config-map-aws-auth > config-map-aws-auth
    kubectl apply -f config-map-aws-auth.yaml
    kubectl get nodes
}
### Deploy container
Deplcont() {
    docker login
    kubectl create deployment --image bilalh1916/spring-boot-docker.jar k8-hello
    watch kubectl get pods

}

Kubconf
Authconf
Deplcont
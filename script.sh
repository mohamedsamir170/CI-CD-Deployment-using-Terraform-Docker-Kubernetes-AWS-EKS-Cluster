if [[ -z $(kubectl get namespace | grep -w development) ]]; then
    kubectl create namespace development
fi

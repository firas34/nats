#!/bin/bash

# list of namespaces
namespace_list=("nats-1" "nats-1" "nats-1")

for namespace in "${namespace_list[@]}"
do
    printf "*********************************************\n"
    printf "Redeploying on namespace: %s\n" "${namespace}"
    printf "*********************************************\n"
    deployment="${namespace}"
    helm uninstall "${deployment}" --namespace "${namespace}"
    helm install "${deployment}" -f helm_nats_super-cluster_"${namespace}".yaml  --namespace "${namespace}" ../helm-nats/nats
    printf "***************************************************************************************************************************************\n"
done
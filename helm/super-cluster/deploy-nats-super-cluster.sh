#!/bin/bash

# list of namespaces
namespace_list=("mcpworker-production" "mcpworker-staging" "msp-production" "msp-staging")

cd "/Users/amakke/workspace/NATS-Study/NATS/helm" || exit
export PATH=$HOME/workspace/cloudTools/acsTools:$HOME/workspace/cloudTools/oc-v3.11:$PATH

for namespace in "${namespace_list[@]}"
do
    printf "*********************************************\n"
    printf "Redeploying on namespace: %s\n" "${namespace}"
    printf "*********************************************\n"
    deployment="nats-${namespace}"
    helm uninstall "${deployment}" --namespace "${namespace}"
    helm install "${deployment}" -f helm_nats_super-cluster_"${namespace}".yaml  --namespace "${namespace}" ../helm-nats/nats
    printf "***************************************************************************************************************************************\n"
done
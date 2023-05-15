# Deploy NATS Super Cluster using Helm

The same approach as that of the normal NATS cluster, however here there are different NATS clusters deployed on multiple namespaces in the same PaaS.

In order to have a super cluster, the helm charts are updated to include a `gateways` section. These gateways would connect the different clusters together to form a super cluster.

List of NATS Clusters / namespaces:

- nats-1           --> `helm_nats_super-cluster_nats-1.yaml`


Each Helm chart would deploy a NATS cluster (3 pods) + nats-box pod in the relative namespace.

The NATS cluster is a StatefulSet, with 3 containers in each NATS pod.

- nats container
- reloader
- Prometheus Exporter

The `nats-box` pod contains the NATS CLI, tools and the binaries to interact with the NATS cluster.

To install any super cluster helm chart:

(Pre-requisite helm install on the local machine)

```bash
cd <PATH_TO_REPO>/helm/super-cluster

# Login to OpenShift PaaS
oc login <url>

# Helm Install
helm install nats-1 -f helm_nats_super-cluster_nats-1.yaml --namespace nats-1 ../helm-nats/nats

# Helm Upgrade - If any change was performed on the chart
helm upgrade nats-1 -f helm_nats_super-cluster_nats-1.yaml --namespace nats-1 ./helm-nats/nats

# Helm Uninstall
helm uninstall nats-1 --namespace nats-1

```

The release name is `nats-1`, which would be used as a prefix for the different resources deployed in the namespace.

When deploying another NATS cluster in another namespace (`nats-2` for example), the 2 clusters would be connected. A producer can push messages to one cluster and a consumer can consume these messages from the another cluster.

# Deploy NATS Cluster using Helm

One example of the helm chart is`helm_nats_cluster_nats-1.yaml`.

This chart deploys a NATS cluster (3 pods) + a nats-box pod.

The NATS cluster is a StatefulSet, with 3 containers in each NATS pod.

- nats container
- reloader
- Prometheus Exporter

The `nats-box` pod contains the NATS CLI, tools and the binaries to interact with the NATS cluster.

To install this helm chart:

(Pre-requisite helm install on the local machine)

```bash
cd <PATH_TO_REPO>/helm

# Login to ERD4 PaaS
oc login api.erd4.paas.amadeus.net:6443

# Helm Install
helm install nats-1 -f helm_nats_cluster_nats-1.yaml --namespace nats-1 ./helm-nats/nats

# Helm Upgrade - If any change was performed on the chart
helm upgrade nats-1 -f helm_nats_cluster_nats-1.yaml --namespace nats-1 ./helm-nats/nats

# Helm Uninstall
helm uninstall nats-1 --namespace nats-1

```

The release name is `nats-1`, which would be used as a prefix for the different resources deployed in the namespace.

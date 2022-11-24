#!/bin/bash
set -e

echo "${K8S_CONFIG}" > actionsTools/deploy-k8s/k8sconfig.yaml
export KUBECONFIG=k8sconfig.yaml
kubectl apply -f ${MANIFEST} -n ${NAMESPACE}

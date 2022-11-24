#!/bin/bash
set -e

echo "${CONFIG}" > actionsTools/deploy-k8s/k8sconfig.yaml
export KUBECONFIG=actionsTools/deploy-k8s/k8sconfig.yaml
kubectl apply -f ${MANIFEST} -n ${NAMESPACE}

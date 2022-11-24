#!/bin/bash
set -e

echo "${K8S_CONFIG}" > k8sconfig.yaml
export KUBECONFIG=k8sconfig.yaml
kubectl apply -f ${MANIFEST} -n ${NAMESPACE}

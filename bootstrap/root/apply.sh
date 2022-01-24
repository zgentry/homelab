#!/bin/sh

curl -fks --connect-timeout 5 https://git.home.arpa \
    || extra_args="--values values-seed.yaml"

helm template \
    --include-crds \
    --namespace argocd \
    ${extra_args} \
    argocd . \
    | kubectl apply -n argocd -f -

kubectl --namespace argocd wait --timeout=300s --for condition=ResourcesUpToDate \
	applicationset/system \
	applicationset/platform \
	applicationset/apps

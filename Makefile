base:
	kind create cluster && helmfile -f meta-cluster/helmfile.yaml apply
umbrella:
	helm install umbrella ./argocd-umbrella
bootstrap: base umbrella
teardown:
	kind delete cluster

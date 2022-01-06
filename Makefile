base:
	minikube start && helmfile -f meta-cluster/helmfile.yaml apply
umbrella:
	helm install umbrella ./argocd-umbrella
bootstrap: base umbrella
teardown:
	minikube delete --purge

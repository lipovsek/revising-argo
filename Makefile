base:
	kind create cluster && helmfile -f meta-cluster/helmfile.yaml apply
umbrella:
	helm install umbrella ./argocd-umbrella
bootstrap: base umbrella
argo_cd_monitor:
	kubectl apply -f utils/argocd-monitor.yaml
teardown:
	kind delete cluster

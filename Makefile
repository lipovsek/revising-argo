base:
	kind create cluster && helmfile -f meta-cluster/helmfile.yaml apply && sleep 180
umbrella:
	helm install umbrella ./argocd-umbrella
bootstrap: base umbrella argocd_password argocd_portforward
argocd_monitor:
	kubectl apply -f utils/argocd-monitor.yaml
teardown:
	kind delete cluster
argocd_password:
	@kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
argocd_portforward:
	kubectl port-forward service/argo-cd-argocd-server -n argo-cd 8080:443
prometheus_portforward:
	kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090
kubectl apply \
-f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.52.0/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml \
--force-conflicts=true \
--server-side
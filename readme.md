helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm install ingress ingress ingress-nginx \
  --namespace ingress --create-namespace \ 
  --set controller.enableLatencyMetrics=true \ 
  --set prometheus.create=true \
  --set rbac.create=true,controller.kind=DaemonSet,controller.service.type=ClusterIP,controller.hostNetwork=true \ 

helm install ingress ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress --create-namespace \
  --set rbac.create=true,controller.kind=DaemonSet,controller.service.type=ClusterIP,controller.hostNetwork=true \ 
  --set controller.metrics.enabled=true \
  --set controller.metrics.serviceMonitor.enabled=true \
  --set controller.metrics.serviceMonitor.additionalLabels.release="kube-prometheus-stack"
locals {
  cluster_name  = "microservices"
  namespace     = "default"
  chart_name    = "kube-prometheus-stack"
  chart_repo    = "https://prometheus-community.github.io/helm-charts"
  chart_version = "57.1.1"
  name          = "monitoring"
}

resource "helm_release" "monitoring" {
  chart      = local.chart_name
  name       = local.name
  namespace  = local.namespace
  repository = local.chart_repo
  version    = local.chart_version

}
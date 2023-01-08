###############################
# kube-dashboard
###############################
# https://docs.k3s.io/installation/kube-dashboard

resource "kubernetes_namespace" "kubernetes_dashboard" {
  metadata {
    name = "kubernetes-dashboard"
  }
}
resource "helm_release" "kubernetes_dashboard" {
  name = "kubernetes-dashboard"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  namespace  = kubernetes_namespace.kubernetes_dashboard.id

  #   set {
  #     name  = "service.type"
  #     value = "LoadBalancer"
  #   }

  set {
    name  = "metricsScraper.enabled"
    value = "true"
  }

  set {
    name  = "metricsServer.enabled"
    value = "true"
  }

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = "true"
  }
}


###############################
# kube-prometheus-stack
###############################
# !!!!! cash loop-back on darwin

resource "kubernetes_namespace" "kube_prometheus_stack" {
  metadata {
    name = "kube-prometheus-stack"
  }
}
resource "helm_release" "kube_prometheus_stack" {
  name = "kube-prometheus-stack"

  repository = "https://prometheus-community.github.io/helm-charts/"
  chart      = "kube-prometheus-stack"
  namespace  = kubernetes_namespace.kube_prometheus_stack.id
}

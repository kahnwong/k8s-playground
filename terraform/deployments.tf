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

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

  set {
    name  = "grafana.defaultDashboardsTimezone"
    value = "Asia/Bangkok"
  }
}


###############################
# csi secret store
###############################
resource "helm_release" "csi_secrets_store" {
  name = "csi-secrets-store"

  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts/"
  chart      = "secrets-store-csi-driver"
  namespace  = "kube-system"
}


###############################
# csi driver: vault
###############################
# https://github.com/hashicorp/vault-csi-provider

resource "kubernetes_namespace" "vault" {
  metadata {
    name = "vault"
  }
}
resource "helm_release" "vault" {
  name = "vault"

  repository = "https://helm.releases.hashicorp.com/"
  chart      = "vault"
  namespace  = kubernetes_namespace.vault.id

  set {
    name  = "server.dev.enabled"
    value = "true"
  }

  set {
    name  = "injector.enabled"
    value = "false"
  }

  set {
    name  = "csi.enabled"
    value = "true"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      app = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          app = "ScalableNginxExample"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }
  spec {
    selector = {
      app = kubernetes_deployment.nginx.spec[0].template[0].metadata[0].labels.app
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

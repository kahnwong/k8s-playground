resource "helm_release" "supersecretmessage" {
  name = "supersecretmessage"

  chart     = "./charts/supersecretmessage"
  namespace = "default"

  #   set {
  #     name  = "rbac.clusterReadOnlyRole"
  #     value = "true"
  #   }
}

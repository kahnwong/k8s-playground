resource "helm_release" "supersecretmessage" {
  name = "supersecretmessage"

  chart     = "./charts/supersecretmessage"
  namespace = "default"
}

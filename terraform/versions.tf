terraform {
  required_version = ">= 1.2.7"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.13.1"
    }
  }
}

project = "kubernetes-nodejs"

app "web-dev" {
  labels = {
    "service" = "web-dev",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "kubernetes-nodejs-web"
        tag   = "dev"
        local = true
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"

      autoscale {
        min_replicas = 2
        max_replicas = 8
        cpu_percent  = 60
      }
    }
  }

  release {
    use "kubernetes" {
      // Sets up a load balancer to access released application
      load_balancer = true
      port          = 3001
    }
  }
}


app "web" {
  labels = {
    "service" = "web",
    "env"     = "prod"
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "kubernetes-nodejs-web"
        tag   = "prod"
        local = true
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"

      autoscale {
        min_replicas = 2
        max_replicas = 8
        cpu_percent  = 60
      }
    }
  }

  release {
    use "kubernetes" {
      // Sets up a load balancer to access released application
      load_balancer = true
      port          = 3000
    }
  }
}

// TODO: set port mapping

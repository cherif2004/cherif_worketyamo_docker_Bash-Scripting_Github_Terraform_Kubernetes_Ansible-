provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "cherif_deploy" {
  metadata {
    name = "cherif-deployment"
    namespace = "rashid"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }

      spec {
        container {
          image = var.httpd-image-name
          name  = "httpd-ct"
          command = [ "sleep" ]
          args = [ "infinity" ]
        }

        container {
          image = var.nginx-image-name
          name  = "nginx-ct"
          command = [ "sleep" ]
          args = [ "infinity" ]
        }
      }
    }
  }
}

   

resource "kubernetes_service" "service_cherif" {
  metadata {
    name = "service-cherif"
    namespace = "rashid"
  }

  spec {
    selector = {
      app = "app"
    }

    port {
      port        = 80
      target_port = 80
      
    }
  }
}
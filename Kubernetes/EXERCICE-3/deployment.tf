provider "kubernetes" {
  config_path = "~/.kube/config"
}


resource "kubernetes_deployment" "cherif-ssh-deployment" {
  metadata {
    name      = "cherif-deployment-ssh"
    labels    = var.labels_of_deployment
    namespace = "worketyamo"
  }
  spec {
    strategy {
      type = "RollingUpdate"
    }
    template {
      metadata {
        namespace = "cherif"
        labels    = var.labels_of_deployment
      }
      spec {
        container {
          name  = "ssh-server"
          image = "cherif1/ansible_ssh"

        }
        node_name = "master"
      }

    }
    selector {
      match_labels = var.labels_of_deployment
    }
    replicas = 3
  }
}

resource "kubernetes_service" "deploy_service" {
    depends_on = [ kubernetes_deployment.rashid-ssh-deployment ]
  metadata {
    name      = "cherif-ssh-deploy-service"
    namespace = "cherif"
    labels    = var.labels_of_deployment
  }
  spec {
    selector = var.labels_of_deployment
    type     = "NodePort"
    port {
      name = "deployssh"
      node_port   = "30004"
      target_port = 22
      port        = 22
    }
  }

}
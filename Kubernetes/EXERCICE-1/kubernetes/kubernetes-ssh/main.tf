provider "kubernetes" {
  config_path    = "~/.kube/config"
}



resource "kubernetes_pod" "single_pod" {
  
 count = length(var.single_pod)
 metadata {
   name = var.single_pod[count.index].pod_name
   namespace = "worketyamo"
   labels = var.labels_of_pods
 }
 spec {
  container {
    name = var.single_pod[count.index].container_name
    image = "cherif1 / ansible_ssh"
    port {
      container_port = 22
    }
  }

  
   node_name =  "master"
  
}

}

   




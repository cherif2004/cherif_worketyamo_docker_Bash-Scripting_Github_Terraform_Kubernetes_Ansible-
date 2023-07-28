resource "kubernetes_service" "single_pod_service" {
  depends_on = [ kubernetes_pod.single_pod ]
  metadata {
    name = "service-ssh-cherif"
    namespace = "worketyamo"
    labels = var.labels_of_pods
  }

  spec {
    type = "NodePort"
    selector = var.labels_of_pods
    port {
      name = "cherif-ssh"
      target_port = 22
      port = 22
      node_port = 30001
    }
  }
}
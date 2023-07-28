variable "labels_of_deployment" {
  type = map(string)
  default = {
    "owner" = "cherif"
    "type" = "ssh"
    "app" ="ssh"
  }
}
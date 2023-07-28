locals {
  name = "cherif"
}

variable "single_pod" {
  type = list(object({
    pod_name = string
    container_name = string
  }))
  
  default = [ {
    pod_name = "cherif-pod-1"
    container_name = "contenair-ssh-cherif-1"
  } 
  ,
  {
    container_name = "contenair-ssh-cherif-2"
    pod_name = "cherif-pod-2"
  }
  ,
  {
    container_name = "contenair-ssh-cherif-3"
    pod_name = "cherif-pod-3"
  }
  ]

}


variable "labels_of_pods" {
  type = map(string)
  default = {
    "owner" = "cherif"
    "type"  = "contenair-ssh"
    "app"   = "app"
  }
}


variable "labels_of_deployment" {
  type = map(string)
  default = {
    "owner" = "cherif"
    "type"  = "contenair-ssh"
    "app"   = "app"
  }
  }



provider "kubernetes" {
  secret_suffix = "cherif"
  config_paths = "~/.kube/config"
}


terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  #alias = "value"
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address = "cherif1/image_cherif.docker.io"
    config_file =  pathexpand("~/.docker/config.json")
    username = var.dockerhub.name_of_user_dockerhub
    password = var.dockerhub.password_dockerhub
  }
}


resource "null_resource" "docker_build" {
  triggers = {
    image_version = var.image_version
  }

  provisioner "local-exec" {
    command = "docker build -t ${var.name_of_image}:${var.image_version} . "
  }
}

resource "null_resource" "docker_tag" {
  provisioner "local-exec" {
    command = "docker tag ${var.name_of_image}:${var.image_version} cherif1/image_cherif:${var.image_version}"
  }
  }



resource "null_resource" "docker_push" {
  triggers = {
    image_version = var.image_version
  }

  provisioner "local-exec" {
    command = "docker push cherif1/image_cherif:${var.image_version}"
  }
}
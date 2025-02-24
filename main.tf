terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx" {
  name         = var.docker_image_name
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = var.docker_container_count
  image = docker_image.nginx.image_id
  name  = "tutorial-${count.index}"
  privileged = var.docker_privileged
  memory = var.docker_memory
  
  ports {
    internal = 80
    external = var.docker_expose_port_start + count.index
  }
}
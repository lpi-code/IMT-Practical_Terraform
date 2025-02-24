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
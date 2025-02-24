resource "docker_container" "nginx" {
  count = var.docker_container_count
  image = docker_image.nginx.image_id
  name  = "tutorial-${count.index}"
  privileged = var.docker_privileged
  memory = var.docker_memory
  
  # Mount the nginx configuration
  volumes {
    host_path      = "${path.module}/nginx.conf"
    container_path = "/etc/nginx/conf.d/default.conf"
    read_only      = true
  }
  
  ports {
    internal = 80
    external = var.docker_expose_port_start + count.index
  }

  # Ensure container restarts if config changes
  restart = "unless-stopped"
}
resource "local_file" "nginx-conf" {
  filename = abspath("${path.module}/nginx.conf")
  content = file(abspath("${path.module}/nginx.conf"))
}

resource "docker_container" "nginx" {
  count = var.docker_container_count
  image = docker_image.nginx.image_id
  name  = "tutorial-${count.index}"
  privileged = var.docker_privileged
  memory = var.docker_memory
  
  # Mount the nginx configuration
  volumes {
    host_path      = abspath("${path.module}/nginx.conf")
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

# Add the nginx image resource if not already present
resource "docker_image" "nginx" {
  name = var.docker_image_name
  keep_locally = true
}
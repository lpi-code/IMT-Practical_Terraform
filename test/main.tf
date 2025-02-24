module "nginx" {
  source                 = "github.com/lpi-code/IMT-Practical_Terraform"
  docker_image_name      = "nginx:latest"
  docker_container_count = 1
  docker_expose_port_start = 8080
}

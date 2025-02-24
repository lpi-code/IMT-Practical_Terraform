variable "docker_image_name" {
    type = string
    default = "nginx:latest"
    description = "Name of the Docker image to use"
}

variable "docker_memory" {
    type = number
    default = 256
    description = "Memory in megabyte to limit the container"
}

variable "docker_privileged" {
    type = bool
    default = false
    description = "Is the container privileged"
}

variable "docker_container_count" {
    type = number
    default = 3
    description = "Number of container to create"
}

variable "docker_expose_port_start" {
    type = number
    default = 8000
    description = "Port starting point to expose (3000, 3001, 3002 ...)"
}

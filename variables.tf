variable "docker_image_name" {
    type = string
    default = "nginx:latest"
    description = "Name of the Docker image to use"
    validation {
        condition = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_.-]*:[a-zA-Z0-9_.-]*$", var.docker_image_name))
        error_message = "Docker image name must be in format image:tag"
    }
}

variable "docker_memory" {
    type = number
    default = 256
    description = "Memory in megabyte to limit the container"
    validation {
        condition = var.docker_memory > 0
        error_message = "Memory must be greater than 0"
    }
}

variable "docker_privileged" {
    type = bool
    default = false
    description = "Is the container privileged"
}

variable "docker_container_count" {
    type = number
    description = "Number of container to create"
    default = 1
    validation {
        condition = var.docker_container_count > 0
        error_message = "Container count must be greater than 0"
    }
}

variable "docker_expose_port_start" {
    type = number
    default = 8000
    description = "Port starting point to expose (3000, 3001, 3002 ...)"
    validation {
        condition = var.docker_expose_port_start >= 1 && var.docker_expose_port_start <= 65535
        error_message = "Port must be between 1 and 65535"
    }
}

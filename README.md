# Terraform Docker Nginx Module

A Terraform module to deploy multiple Nginx containers with configurable parameters.

## Features

- Deploy multiple Nginx containers
- Configurable memory limits
- Automatic port mapping
- Privileged mode support

## Requirements

- Terraform >= 1.0.0
- Docker provider >= 3.0.0
- Docker daemon running on the host

## Usage

Basic usage:

```hcl
module "nginx" {
source = "github.com/lpi-code/IMT-Practical_Terraform"
docker_image_name = "nginx:latest"
docker_container_count = 2
docker_expose_port_start = 8000
}
```


Advanced usage with all parameters:

```hcl
module "nginx" {
source = "github.com/lpi-code/IMT-Practical_Terraform"
docker_image_name = "nginx:1.24"
docker_container_count = 3
docker_expose_port_start = 8000
docker_memory = 512
docker_privileged = false
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| docker_image_name | The name of the Docker image to use | `string` | n/a | yes |
| docker_container_count | Number of Nginx containers to create | `number` | n/a | yes |
| docker_expose_port_start | Starting port number for external port mapping | `number` | n/a | yes |
| docker_memory | Memory limit for each container (in MB) | `number` | `256` | no |
| docker_privileged | Run containers in privileged mode | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| container_ids | List of container IDs |
| container_names | List of container names |
| exposed_ports | List of exposed external ports |

## Examples

### Single Container
```hcl
module "nginx" {
source = "github.com/lpi-code/IMT-Practical_Terraform"
docker_image_name = "nginx:latest"
docker_container_count = 1
docker_expose_port_start = 8080
}

### Multiple Containers with Custom Memory

```hcl
module "nginx_cluster" {
source = "github.com/lpi-code/IMT-Practical_Terraform"
docker_image_name = "nginx:latest"
docker_container_count = 3
docker_expose_port_start = 8000
docker_memory = 512
}
```

## Contributing

Feel free to submit issues and enhancement requests.

## License

MIT Licensed. See LICENSE for full details.


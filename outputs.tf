output "container_ids" {
  description = "IDs of the created containers"
  value       = docker_container.nginx[*].id
}

output "container_names" {
  description = "Names of the created containers"
  value       = docker_container.nginx[*].name
}

output "exposed_ports" {
  description = "List of exposed external ports"
  value       = [for container in docker_container.nginx : container.ports[0].external]
} 
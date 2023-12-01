terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.4"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = var.container_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}

output "dem_ips_tho" {
    value = docker_container.nginx.ip_address //whatever attribute you'd like to be printed separately and easily viewed!
}

variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}

variable "internal_port" {
  description = "Internal port of the container"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "External port on the container"
  type        = number
  default     = 24601
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.4"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = var.external_port
  }
}

variable "container_name" {
  default = "ExampleNginxContainer"
}

variable "external_port" {
  default = 2224
}

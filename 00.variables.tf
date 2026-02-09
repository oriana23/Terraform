###Variables###

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  default = "ami-0532be01f26a3de55"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default = "t3.small"
}

variable "server_name" {
  description = "Nombre del servidor web"
  default = "nginx-server"
}

variable "environment" {
  description = "Ambiente de la aplicaciòn"
  default = "test"
}

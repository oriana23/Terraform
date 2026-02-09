output "server_publib_ip" {
  description = " Direccion IP publica de la instancia EC2"
  value = aws_instance.nginx-server.public_ip
  
}

output "server_publib_dns" {
  description = "DNS publico de la instancia EC2"
  value = aws_instance.nginx-server.public_dns
  
}
resource  "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx

            EOF

key_name = aws_key_pair.nginx-server-ssh.key_name

vpc_security_group_ids = [
  aws_security_group.nginx-server-sg.id
 ]

 tags = {
   Name= var.server_name
   Environment = var.environment
   Owner = "oria.ramirez@outlook.com"
   Team: "DevOps"
   Project = "Webinar"

}

}

resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name = aws_key_pair.nginx-server-ssh.key_name
  

  vpc_security_group_ids = [
    
    aws_security_group.jenkins_sg.id
    
  ]

  # Este bloque instala Jenkins automáticamente al iniciar
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install java-17-amazon-corretto -y
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
              sudo yum install jenkins -y
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              sudo yum install git -y
              EOF

  tags = {
    Name = "Jenkins-Control-Plane"
  }
}
resource "aws_instance" "EC2_Instance" {
  ami           = "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
}


output "EC2_Public_IP" {
  description = "IP publica asignada a la instancia EC2"
  value       = aws_instance.EC2_Instance.public_ip
}
output "EC2_Private_IP" {
  description = "IP privada asignada a la instancia EC2"
  value       = aws_instance.EC2_Instance.private_ip
}
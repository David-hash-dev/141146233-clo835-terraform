output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "webapp_ecr_url" {
  value = aws_ecr_repository.webapp_repo.repository_url
}

output "mysql_ecr_url" {
  value = aws_ecr_repository.mysql_repo.repository_url
}

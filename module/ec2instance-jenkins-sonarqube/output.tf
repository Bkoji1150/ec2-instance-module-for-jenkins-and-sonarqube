output "public_ipp" {
  value = [for ip in aws_instance.this : ip.public_ip]
}

output "jenkins_arn" {
  value = [for r in aws_instance.this : r.arn]
}

output "jenkins_id" {
  value = [for id in aws_instance.this : id.id]
}

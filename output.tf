
# output "jenkins_public_ip" {
#   description = "below is the jenkins master/client instance public ipp"
#   value = format("http://%s:%s", for ip in module.jenkins_client: ip.public_ipp, var.jenkins_port)
# }

output "sonar_ip" {
  description = "below is the jenkins agent ipp"
  value       = format("http://%s:%s", module.Sonarqube_instance.public_ipp[0], 9000)
}

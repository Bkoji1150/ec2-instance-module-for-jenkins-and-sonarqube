output "jenkins_master_ip" {
  description = "below is the jenkins master instance ipp"
  #   value       = module.jenkins_master.public_ipp[0] 
  value = format("http://%s:%s", module.jenkins_master.public_ipp[0], var.jenkins_port)
}

output "jenkins_agent_ip" {
  description = "below is the jenkins agent ipp"
  value       = format("http://%s:%s", module.jenkins_agent.public_ipp[0], var.jenkins_port)
}

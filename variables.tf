variable "public_key_path" {
  type        = string
  description = "local keypair"
  default     = "/Users/kojibello/.ssh/id_rsa.pub"
}

variable "aws_region" {
  type        = string
  description = "The region with which this template would be deployed"
  default     = "us-east-1"
}

variable "ami" {
  type        = string
  description = "ami id specific only to for jenkins/sonarqube build in us-east-1"
  default     = "ami-0a8b4cd432b1c3063"
}

variable "instance_type" {
  description = "Instance type for both jenkins instance and sonarqube"
  default     = "t2.medium"
}

variable "sonarqube_name" {
  description = "instance name for sonarqube instance"
  default     = "Sonarqube"
}

variable "jenkins_name" {
  description = "instance name for jenkins instance"
  default     = "JenkinsMaster"
}

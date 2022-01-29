terraform {
  cloud {
    organization = "hqr-blesses"

    workspaces {
      name = "hqr-jenkins-sonarqube"
    }
  }
}

#! /bin/bash 
amazon-linux-extras install java-openjdk11 -y
# wget https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/[RELEASE]/jfrog-artifactory-oss-[RELEASE]-linux.tar.gz

wget https://releases.jfrog.io/artifactory/artifactory-rpms/artifactory-rpms.repo -O jfrog-artifactory-rpms.repo;
sudo mv jfrog-artifactory-rpms.repo /etc/yum.repos.d/;
sudo yum update && sudo yum install jfrog-artifactory-oss -y 
service artifactory start 
service artifactory status 

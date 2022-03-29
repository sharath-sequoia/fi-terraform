#!/bin/bash
yum update -y
sudo yum install -y jenkins java-11-openjdk-devel
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo systemctl start jenkins
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

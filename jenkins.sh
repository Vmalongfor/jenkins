#!/bin/bash
## Athor: Veroline
## Date: 10/20/2022
####--------Jenkins installation--------

echo  "step 1:Install Java"
sleep 3
sudo yum install java-11-openjdk-devel -y

echo "Step 2: Enable the Jenkins repository"
sleep 3

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

echo "Step 3: Install the latest stable version of Jenkins"
sleep 3

sudo yum install jenkins -y

echo "After the installation process is completed, we need to start the service :"
sleep 3
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins

echo "Step 4: Adjust the firewall"
sleep 3

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload


yum update -y
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
yum install tomcat9-webapps tomcat9-admin-webapps

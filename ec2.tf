module "jenkins_master_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "jenkins-master-instance"
  ami                    = "ami-0cde3ffbd04841819"
  instance_type          = "t2.micro"
  key_name               = "jenkins-key"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.jenkins_master_instance.id]
  subnet_id              = module.vpc.public_subnets[0]
  user_data_base64 = filebase64("userdata/jenkins-instance.sh")
  tags = local.tags
}

module "application_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = "application-instance"
  ami                    = "ami-0cde3ffbd04841819"
  instance_type          = "t2.micro"
  key_name               = "app-instance-key"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.application_instance.id]
  subnet_id              = module.vpc.private_subnets[0]
  user_data_base64 = filebase64("userdata/application-instance.sh")
  tags = local.tags
}

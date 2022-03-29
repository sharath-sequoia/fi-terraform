resource "aws_security_group" "jenkins_master_instance" {
  name        = "jenkins-master-instance-sg"
  description = "Security group for jenkins master instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from outside world"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]//Allowing from anywhere for demo. But for better security, should be restricted to company VPN CIDR.
    ipv6_cidr_blocks = ["::/0"]//Allowing from anywhere for demo. But for better security, should be restricted to company VPN CIDR.
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.tags
  depends_on = [module.vpc]
}

resource "aws_security_group" "application_instance" {
  name        = "application-instance-sg"
  description = "Security group for application instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC subnets"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = concat(local.private_subnets, local.public_subnets)
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.tags
  depends_on = [module.vpc]
}

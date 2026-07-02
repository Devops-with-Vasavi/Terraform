resource "aws_instance" "terraform_demo" {
  ami                    = data.aws_ami.joindevops
  instance_type          = t3.micro
  vpc_security_group_ids = [aws_security_group.allow_terraform.id] # list
  # labels, metadata, info, etc
  tags = {
    name = local.name 
  }
}

# It creates in default VPC
resource "aws_security_group" "allow_terraform" {
  name        = "${local.name}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
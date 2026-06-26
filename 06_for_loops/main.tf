resource "aws_instance" "roboshop" {
  count = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id 
   ]     # list
  # labels, metadata, info, etc
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}" #interpolation
  }
}

# It creates in default VPC
resource "aws_security_group" "roboshop" {
  count = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1" # all traffic
    cidr_blocks = var.cidr
  }

  tags = {
  Name  = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # outbound traffic
  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1" # all traffic
    cidr_blocks = var.cidr
  }

  tags = {
  Name  = "${var.project}-${var.environment}-common}"
  }
}
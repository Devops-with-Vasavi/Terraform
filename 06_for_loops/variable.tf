
variable "environment" {
    type = string
    default = "dev"
}

variable "project" {
  type = string
  default = "roboshop"
}

variable "instances" {
  type = list
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL9 joindevops image"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }
}

variable "sg_name" {
  type    = string
  default = "allow_terraform_vars"
}

variable "port" {
  default = 0
  type    = number
}

variable "cidr" {
  type    = list
  default = ["0.0.0.0/0"]
}

variable "instance" {
  type = map
  default = {
    mongodb = {
      "instance_type" = "t3.micro"
    }
    redis = {
      "instance_type" = "t3.micro"
    }
    mysql = {
      "instance_type" = "t3.micro"
    }
    rabbitmq = {
      "instance_type" = "t3.micro"
    }
    
   

  }
  
  
}
variable "domain_name" {
  type =  string
  default = "mydaws.online"
}

variable "zone_id" {
  type = string
  default = "Z01869663BV0Y667K7V9L"
}
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_lightsail_instance" "server" {
  count = var.instance_count

  name              = "demo-${count.index + 1}"
  availability_zone = var.availability_zone

  blueprint_id = "ubuntu_22_04"
  bundle_id    = "micro_3_0"

  tags = {
    environment = "demo"
  }

  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install -y software-properties-common
add-apt-repository --yes ppa:ansible/ansible
apt update -y
apt install -y ansible
EOF
}

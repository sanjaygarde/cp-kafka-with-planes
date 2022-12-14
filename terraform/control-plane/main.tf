terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "jumpbox" {
  ami                    = "ami-0c09c7eb16d3e8e70"
  instance_type          = "t2.medium"
  vpc_security_group_ids = ["sg-084fafd9eacb2fdb8"]
  count                  = 1
  key_name               = "sanjay-cops-us-west-2"

  tags = {
    Name  = "JumpBox-CP-SDG"
    Owner = "Sanjay Garde"
    Email = "sanjay@confluent.io"
  }
}

resource "aws_instance" "zookeeper" {
  ami                    = "ami-0c09c7eb16d3e8e70"
  instance_type          = "t2.large"
  vpc_security_group_ids = ["sg-084fafd9eacb2fdb8"]
  count                  = 3
  key_name               = "sanjay-cops-us-west-2"

  tags = {
    Name  = "ZK-CP-SDG"
    Owner = "Sanjay Garde"
    Email = "sanjay@confluent.io"
  }
}

resource "aws_instance" "kafka" {
  ami                    = "ami-0c09c7eb16d3e8e70"
  instance_type          = "r3.large"
  vpc_security_group_ids = ["sg-084fafd9eacb2fdb8"]
  count                  = 3
  key_name               = "sanjay-cops-us-west-2"

  root_block_device {
    volume_size           = "40"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name  = "Broker-CP-SDG"
    Owner = "Sanjay Garde"
    Email = "sanjay@confluent.io"
  }
}

resource "aws_instance" "controlcenter" {
  ami                    = "ami-0c09c7eb16d3e8e70"
  instance_type          = "r3.large"
  vpc_security_group_ids = ["sg-084fafd9eacb2fdb8"]
  count                  = 1
  key_name               = "sanjay-cops-us-west-2"

  root_block_device {
    volume_size           = "40"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name  = "C3-SDG"
    Owner = "Sanjay Garde"
    Email = "sanjay@confluent.io"
  }
}

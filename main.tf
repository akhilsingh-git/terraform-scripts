provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03a933af70fa97ad2" # Ubuntu 20.04 LTS
  instance_type = "t2.medium"
  key_name      = aws_key_pair.example.key_name

  vpc_security_group_ids = ["sg-097468519872ef662"] # Use the existing security group ID

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = "16"
  }

  tags = {
    Name = "example-instance"
  }
}

resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = file("test.pem.pub") # Replace with the name of your public key file
}

resource "null_resource" "install_tools" {
  depends_on = [aws_instance.example]

  connection {
    type        = "ssh"
    host        = aws_instance.example.public_ip
    user        = "ubuntu"
    private_key = file("test.pem") # Replace with the name of your private key file
  }

  provisioner "remote-exec" {
    script = "install_tools.sh"
  }
}


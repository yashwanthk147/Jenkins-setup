# aws ec2 describe-images --image-ids ami-0a0e5d9c7acc336f1 --region us-east-1 | jq ".Images[0].OwnerId"
# "099720109477"
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/*"]
  }
}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.latest_ubuntu.id 
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]
  #user_data              = templatefile("./install_jenkins.sh", {})
  iam_instance_profile   = var.iam_inst_prf

  tags = merge(var.tags, {
    Name = var.instance_name
  })

  root_block_device {
    volume_size = 30
  }
}




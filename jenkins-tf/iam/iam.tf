resource "aws_iam_role" "jenkins_role" {
  name = "Jenkins-terraform"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_instance_profile" "example_profile" {
  name = "Jenkins-iam"
  role = aws_iam_role.jenkins_role.name
}

output "iam_inst_prf" {
    value = aws_iam_instance_profile.example_profile.name
  
}
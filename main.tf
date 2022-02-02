
locals {
  default_tags = {
    name                    = "JenkinsMaster"
    Created_by              = "Terraform"
    App_Name                = "ovid"
    Cost_center             = "xyz222"
    Business_unit           = "Automation"
    App_role                = "web_server"
    Environment             = "dev"
    Security_Classification = "Internal"
  }
  availability_zone = "${var.aws_region}a"
  name              = var.ebs_volume_attachmentName
  region            = var.aws_region
}

resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file(var.public_key_path)
}

module "jenkins_client" {
  source = "./module/ec2instance-jenkins-sonarqube"

  for_each                    = toset(var.jenkins_client)
  instance_type               = var.instance_type
  name                        = "jenkins-${each.key}"
  ami                         = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = aws_key_pair.key.id
  user_data                   = "${path.root}/template.tpl"
}

module "Sonarqube_instance" {
  source                      = "./module/ec2instance-jenkins-sonarqube"
  instance_type               = var.instance_type
  name                        = var.sonarqube_name
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key.id
  ami                         = var.ami
  user_data                   = "${path.root}/sonar.tpl"
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.Sonarqube_instance.jenkins_id[0]
}

resource "aws_ebs_volume" "this" {
  availability_zone = local.availability_zone
  size              = 50
}

resource "aws_iam_policy" "ec2_policy" {
  name        = "ec2_policy"
  path        = "/"
  description = "Policy to provide permission to EC2"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "application-autoscaling:*",
          "autoscaling:*",
          "apigateway:*",
          "cloudfront:*",
          "cloudwatch:*",
          "cloudformation:*",
          "dax:*",
          "dynamodb:*",
          "ec2:*",
          "ec2messages:*",
          "ecr:*",
          "ecs:*",
          "elasticfilesystem:*",
          "elasticache:*",
          "elasticloadbalancing:*",
          "es:*",
          "events:*",
          "iam:*",
          "kms:*",
          "lambda:*",
          "logs:*",
          "rds:*",
          "route53:*",
          "ssm:*",
          "ssmmessages:*",
          "s3:*",
          "sns:*",
          "sqs:*",
          "ec2:DescribeNetworkInterfaces",
          "ec2:CreateNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DescribeInstances",
          "ec2:AttachNetworkInterface"
        ],
        Resource = "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}
# 
resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name       = "ec2_attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "Jenkins-instance-role"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name = "Jenkins-instance-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

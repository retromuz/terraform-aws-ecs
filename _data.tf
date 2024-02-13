data "aws_region" "current" {}
data "aws_ami" "amzn" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  name_regex = ".+-ecs-hvm-2023.0.202402.+x86_64$"
}

data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}

#-------
# KMS
data "aws_kms_key" "ebs" {
  key_id = "alias/aws/ebs"
}

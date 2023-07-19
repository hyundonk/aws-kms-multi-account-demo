variable "aws_region" {
  description = "AWS region"
  default     = "ap-northeast-2"
}

locals {
  dest_list_arns   = formatlist("arn:aws:iam::%s:user/minki", var.dest_account_ids)
  #dest_list_arns   = formatlist("arn:aws:iam::%s:root", var.dest_account_ids)
  source_list_arns = formatlist("arn:aws:iam::%s:root", var.src_account_ids)
  dest_list        = concat(local.dest_list_arns, var.dest_iam_roles)
  src_list         = concat(local.source_list_arns, var.src_iam_roles)
}

variable "tags" {
  default = {
    Owner = "devops"
  }
}
variable "key_name" {
  default = "devops-key-sharing"
}

variable "user_policy" {
  default = ""
}

variable "dest_account_ids" {}
variable "src_account_ids" {}
variable "dest_iam_roles" {
  type    = list(string)
  default = []
}
variable "src_iam_roles" {
  type    = list(string)
  default = []
}



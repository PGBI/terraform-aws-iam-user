# AWS IAM User module

## Description

This module is a simple wrapper around the aws resources `aws_iam_user`, `aws_iam_access_key` and
 `aws_iam_role_policy`. It creates:
 * a user whose name will be prefixed with the terraform workspace and the project name,
 * the specified IAM policies for the user,
 * an AWS CLI access key for the user.

## Usage:

```hcl
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myProject"
  vcs_repo = "github.com/account/project"
}

/**
 * Create an IAM user whose name will be "prod-myproject-bob" if the terraform workspace is "prod".
 * Grant that role the permission to describe any EC2 instances.
 */
module "user" {
  source  = "PGBI/iam-user/aws"
  version = "~>0.1.0"

  name        = "bob"
  project     = module.project

  policies = {
    describe_ec2s = {
      Action   = ["ec2:Describe*"]
      Resource = ["*"]
      Effect   = "Allow"
    }
  }
}
```

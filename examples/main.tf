/**
 * Configure the AWS Provider
 */
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

/**
 * Initialize the project
 */
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myproject"
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

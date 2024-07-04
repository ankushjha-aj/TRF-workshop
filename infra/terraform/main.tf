# Define local variables
locals {
  configs = module.config.configs # Retrieve configurations from the config module
  secrets = module.config.secret_data
}

# Module for configuring common settings
module "config" {
  source                = "./modules/config"
  enable_config_secrets = false
}

# Module for configuring secrets
module "aws_ec2" {
  source            = "./modules/aws_ec2"
  aws_instance_type = lookup(local.configs, "aws_instance_type")
  # public_subnet_conf  = lookup(local.configs, "public_subnet_conf")
  public_subnet_id = module.aws_subnets.public_subnet_ids
  aws_ami          = lookup(local.configs, "aws_ami")
  org_name         = lookup(local.configs, "org_name")
  app_name         = lookup(local.configs, "app_name")
  env              = terraform.workspace
}

# Module for vpc
module "aws_vpc" {
  source              = "./modules/aws_vpc"
  vpc_cidr_block      = lookup(local.configs, "vpc_cidr_block")
  domain_name         = lookup(local.configs, "domain_name")
  domain_name_servers = lookup(local.configs, "domain_name_servers")
  org_name            = lookup(local.configs, "org_name")
  app_name            = lookup(local.configs, "app_name")
  env                 = terraform.workspace
}

# Module for subnet
module "aws_subnets" {
  source              = "./modules/aws_subnet"
  vpc_id              = module.aws_vpc.vpc_id
  public_subnet_conf  = lookup(local.configs, "public_subnet_conf")
  private_subnet_conf = lookup(local.configs, "private_subnet_conf")
  env                 = terraform.workspace
}

# Module for routing table
module "aws_route_table" {
  source            = "./modules/aws_route_table"
  vpc_id            = module.aws_vpc.vpc_id
  igw_id            = module.aws_internet_gateway.igw_id
  public_subnet_id  = module.aws_subnets.public_subnet_ids
  nat_gateway_id    = module.aws_nat_gateway.nat_gateway_id
  private_subnet_id = module.aws_subnets.private_subnet_ids
  org_name          = lookup(local.configs, "org_name")
  app_name          = lookup(local.configs, "app_name")
  env               = terraform.workspace
}

# Module for Internet Gateway
module "aws_internet_gateway" {
  source   = "./modules/aws_internet_gateway"
  vpc_id   = module.aws_vpc.vpc_id
  org_name = lookup(local.configs, "org_name")
  app_name = lookup(local.configs, "app_name")
  env      = terraform.workspace
}

# Module for nat gateway
module "aws_nat_gateway" {
  source           = "./modules/aws_nat_gateway"
  vpc_id           = module.aws_vpc.vpc_id
  public_subnet_id = module.aws_subnets.public_subnet_ids
  org_name         = lookup(local.configs, "org_name")
  app_name         = lookup(local.configs, "app_name")
  env              = terraform.workspace
}


module "aws_s3" {
  source          = "./modules/aws_s3"
  bucket_name     = lookup(local.configs, "bucket_name")
  index_file_path = "C:/Users/Admin/Desktop/terraform-make/infra/terraform/modules/aws_s3/index.html"
  cloudfront_domain_name = module.aws_cloudfront.cloudfront_domain_name
}

module "aws_cloudfront" {
  source                    = "./modules/aws_cloudfront"
  bucket_name               = module.aws_s3.bucket_name
  cloudfront_domain_name = module.aws_cloudfront.cloudfront_domain_name
}

output "cloudfront_url" {
  value = module.cloudfront.cloudfront_url
}

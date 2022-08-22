# terraform_rds_parameters

Terraform module to create rds cluster parameters' group.

## Dependencies

None

## Terraform example

``` terraform
###################
# RDS params variable
###################
variable "aurora-mysql57-params" {
  default = {
    list = [
      { name = "max_connections", value = "1024" },
      { name = "max_user_connections", value = "512" }
    ]
  }
}

###################
# RDS params module
###################
module "rds_aurora57_cluster_params" {
  source = "github.com/virsas/terraform_rds_cluster_parameters"
  name   = "aurora57-params"
  family = "aurora-mysql5.7"
  params = var.aurora-mysql57-params
}
```

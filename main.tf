provider "aws" {
  region = var.region
}

resource "aws_rds_cluster_parameter_group" "params" {
  name   = var.name
  family = var.family
  
  dynamic "parameter" {
    for_each = [for p in var.params.list: {
      name = p.name
      value = p.value
    }]

    content {
      name = parameter.value.name
      value = parameter.value.value
    }
  }
}
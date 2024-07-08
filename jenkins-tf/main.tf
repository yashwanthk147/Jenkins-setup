module "iam" {
    source = "./iam"
  
}

module "sg" {
    for_each = var.sg
    source = "./sg"
    sg_name = each.value["sg_name"]
    tags                 = var.tags
  
}

module "ec2" {
    for_each            = var.ec2
    source              = "./ec2"
    instance_name       = each.value["instance_name"]
    instance_type        = each.value["type"]
    key_name             = each.value["key"]
    sg_id                = module.sg[each.key].sg_id
    iam_inst_prf         = module.iam.iam_inst_prf
    tags                 = var.tags
  
}

output "sg" {
    value = module.sg
  
}





module "demo_rg_module"{
  source                  = "../modules/rg"
  resource_group_name     = "module_rg_demo"
  demo_resource_location  = "Central US"
}

# Create virtual network
module "demo_vnet_module" {
  source                  = "../modules/vnet"
  demo_resource_location  = module.demo_rg_module.demo_resource_location
  resource_group_name     = module.demo_rg_module.resource_group_name
}

# Create subnet
module "demo_subnet_module" {
  source               = "../modules/subnet"
  resource_group_name  = module.demo_rg_module.resource_group_name
  vnet_name            = module.demo_vnet_module.vnet_name
}









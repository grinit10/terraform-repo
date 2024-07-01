# Example import command:

terraform import -var-file="terraform.dev.tfvars" module.dev[0].module.common.module.resource-group.azurerm_resource_group.this /subscriptions/4756d118-f8ce-43b8-835e-f3d4a0aeff7a/resourceGroups/resume-rg-dev

# Example terraform apply command:

terraform apply --auto-approve -var-file="terraform.dev.tfvars" 
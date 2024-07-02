module "resource-group" {
  source = "../modules/azure/resource-group"
  name = "resume-rg-${var.environment}"
  tags = {
    environment = "${var.environment}"
    project     = "resume-optimizer"
  }
}
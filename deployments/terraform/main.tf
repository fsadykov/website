## Terraform configuration to deploy hello world application
module "website" {
  source                 = "fuchicorp/chart/helm"
  version                = "0.0.12"                                                                                    ## Version of module is hard coded using helm3
  deployment_name        = "website"                                                                               ## The helm release name
  deployment_environment = var.deployment_environment                                                                  ## Deployment environment kubernetes namespace
  deployment_endpoint    = "${lookup(var.deployment_endpoint, var.deployment_environment)}${var.google_domain_name}"   ## Deployment endpoint to see hello world application
  deployment_path        = "./charts/website"                                                                      ## Deployment path which is local chart location
  enabled                = var.hello_world["enabled"]

  ## Custom vars if you would like to customize helm chart
  template_custom_vars = {
    deployment_image       = var.deployment_image
    deployment_environment = var.deployment_environment
  }
}

## Terraform output for hello world
output "application_endpoint" {
  value = "${var.deployment_endpoint[var.deployment_environment]}${var.google_domain_name}"
}

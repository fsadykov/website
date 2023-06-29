module "website" {
  source                 = "fuchicorp/chart/helm"
  version                = "v0.1.1"
  deployment_name        = "website"                   ## Release name in the namespace
  deployment_environment = var.deployment_environment                                ## Kubernetes Namespace
  deployment_path        = "charts/website"            ## Remote chart location
  remote_chart           = false                              ## Set to false for local chart
  enabled                = true                               ## Enable to deploy the chart
  template_custom_vars   = {
    deployment_endpoint   = lookup(var.deployment_endpoint, var.deployment_environment)
    deployment_image      = var.deployment_image
    replicas              = lookup(var.dynamic_replicas, var.deployment_environment)
  }
}


variable "deployment_endpoint" {
  type        = map
  default     = {
    prod    = "fsadykov.com"
    stage   = "stage.fsadykov.com"
    qa      = "qa.fsadykov.com"
    dev     = "dev.fsadykov.com"
    }
  description = "-(Optional) The endpoint of the application"
}


variable "dynamic_replicas" {
  type        = map
  default     = {
    prod    = 10
    stage   = 5
    qa      = 3
    dev     = 1
    }
  description = "-(Optional) The dynamic replicas based on the environment"
}


variable "deployment_environment" {
  type        = string
  default     = "stage"
  description = "-(Optional) The namespace to deploy"
}

variable "deployment_image" {
  type        = string
  default     = "docker.fsadykov.com/website:v0.0.1"
  description = "-(Optional) The docker image to deploy"
}



output "deployment_endpoint" {
  value       = lookup(var.deployment_endpoint, var.deployment_environment)
}

resource "oci_resourcemanager_stacks" "this" {
  for_each = var.stack_params

  compartment_id = var.compartment_id
  display_name   = var.stack_name

  config_source {
    configuration_source_provider_id = var.source_provider_id
    repository_url                   = var.repo_url
    branch_name                      = "main"
    working_directory                = var.folder
  }

  terraform_version = "1.5.x"
}

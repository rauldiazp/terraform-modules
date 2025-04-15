variable "stack_params" {
  description = "Map of stack configurations for each client"
  type = map(object({
    stack_name = string
    folder     = string
  }))
}

variable "compartment_id" {
  type        = string
  description = "OCI Compartment OCID"
}

variable "source_provider_id" {
  type        = string
  description = "OCI Source Provider OCID"
}

variable "repo_url" {
  type        = string
  description = "Git repository URL for stack source"
}
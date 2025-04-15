variable "stack_params" {
  description = "Map of stack configurations for each client"
  type = map(object({
    stack_name           = string
    folder               = string
    compartment_id       = string
    source_provider_id   = string
    repo_url             = string
  }))
}
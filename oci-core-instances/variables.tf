variable "compartment_ocid" {
  description = "Compartment"
  type        = string
}

variable "ssh_public_key" {
  description = "Placeholder with the SSH to use in Linux servers"
  type        = string
}

variable "images" {
  description = "Placeholder with the OCID of the images to use"
  type = map(object({
    name           = string
    image    = string
  }))
}

variable "instance_params" {
  description = "Core instance parameters"
  type = map(object({
    hostname                            = string
    ad                                  = number
    shape                               = string
    instance_shape_config_ocpus         = number
    instance_shape_config_memory_in_gbs = number
    baseline_ocpu_utilization           = optional(string)
    os                                  = string
    subnet_name                         = string
  }))
}

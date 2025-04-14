variable "compartment_ocid" {
  description = "Compartment"
  type        = string
}

variable "subnet_id" {
  description = "Subnet"
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
    region_ocid    = string
  }))
}

variable "instance_params" {
  description = "Core instance parameters"
  type = map(object({
    hostname                            = string
    ad                                  = number
    shape                               = string
    instance_shape_config_ocpus         = optional(number)
    instance_shape_config_memory_in_gbs = optional(number)
    os                                  = string
    assign_public_ip                    = bool
    subnet_name                         = string

    preserve_boot_volume                = optional(bool)
    private_ip                          = optional(string)
    vnic_display_name                   = optional(string)
    network_type                        = optional(string)
    baseline_ocpu_utilization           = optional(string)
    boot_volume_size                    = optional(number)
    boot_volume_vpus_per_gb             = optional(number)
    recovered                           = optional(bool)
    boot_volume                         = optional(string)
  }))
}


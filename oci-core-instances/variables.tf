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
    instance_shape_config_ocpus         = number
    instance_shape_config_memory_in_gbs = number
    os                                  = string
    # boot_volume_size                    = number
    # preserve_boot_volume                = bool
    assign_public_ip                    = bool
    subnet_name                         = string
    # private_ip                          = string    
    # recovered                           = bool
    # boot_volume                         = string  
    # old_cloud_init                      = bool
    # network_type                        = string
  }))
  default = {}
}

resource "ocicore_instance" "this" {
  for_each = var.instance_params

  availability_domain  = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id       = var.compartment_ids[each.value.compartment_name]
  shape                = each.value.shape
  display_name         = each.value.hostname
  preserve_boot_volume = each.value.preserve_boot_volume

  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    private_ip       = each.value.private_ip
    display_name     = each.value.vnic_display_name
    hostname_label   = each.value.hostname
  }
  launch_options {
    network_type = each.value.network_type
  }

  dynamic "shape_config" {
  for_each = length(regexall("Flex", lookup(each.value, "shape", "VM.Standard3.Flex"))) > 0 ? [1] : []
    content {
      memory_in_gbs = each.value.instance_shape_config_memory_in_gbs
      ocpus         = each.value.instance_shape_config_ocpus
      baseline_ocpu_utilization = each.value.baseline_ocpu_utilization
    }
  }

  dynamic "source_details" {
    for_each = try(each.value.recovered, false) ? [] : [1]
    content {
    boot_volume_size_in_gbs = each.value.boot_volume_size
    boot_volume_vpus_per_gb = each.value.boot_volume_vpus_per_gb
    source_type             = "image"
    source_id = var.linux_images[each.value.os][var.region]
    }
  }

  dynamic "source_details" {
    for_each = try(each.value.recovered, false) ? [1] : []
    content {
    source_type             = "bootVolume"
    source_id = each.value.boot_volume
    }
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

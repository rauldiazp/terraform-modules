resource "oci_core_instance" "this" {
  for_each = var.instance_params

  availability_domain  = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id       = var.compartment_ocid
  shape                = each.value.shape
  display_name         = each.value.hostname

  dynamic "shape_config" {
  for_each = length(regexall("Flex", lookup(each.value, "shape", "VM.Standard3.Flex"))) > 0 ? [1] : []
    content {
      memory_in_gbs = each.value.instance_shape_config_memory_in_gbs
      ocpus         = each.value.instance_shape_config_ocpus
      baseline_ocpu_utilization = each.value.baseline_ocpu_utilization
    }
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

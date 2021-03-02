## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "azure_server_public_ip" {
  value = azurerm_linux_virtual_machine.azure_compute_vm.public_ip_address
}

output "oracle_server_public_ip" {
  value = oci_core_instance.oci_compute_instance.public_ip
}

# output "report_path" {
#   value = "${azurerm_storage_blob.example.url}"
# }
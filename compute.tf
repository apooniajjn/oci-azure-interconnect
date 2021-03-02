## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Create Compute VM Network Interface Card
resource "azurerm_network_interface" "compute_vm_vnic" {
  provider            = azurerm.azure
  name                = var.azure_compute_vnic_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.compute_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.machine_public_ip.id
  }
}

# ------ Create Compute VM on Azure
resource "azurerm_linux_virtual_machine" "azure_compute_vm" {
  provider                        = azurerm.azure
  name                            = var.azure_compute_machine_name
  resource_group_name             = azurerm_resource_group.resource_group.name
  location                        = azurerm_resource_group.resource_group.location
  size                            = "Standard_F2"
  disable_password_authentication = "true"
  admin_username                  = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }


  network_interface_ids = [
    azurerm_network_interface.compute_vm_vnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Oracle"
    offer     = "Oracle-Linux"
    sku       = "77"
    version   = "latest"
  }
  # provisioner "file" {
  #   content     = "${file(var.ssh_private_key_path)}"
  #   destination = "/tmp/ssh.key"
  #   connection {
  #     host        = "${self.public_ip_address}"
  #     type        = "ssh"
  #     user        = "adminuser"
  #     private_key = "${file(var.ssh_private_key_path)}"
  #   }
  # }

  # provisioner "file" {
  #   source      = "${data.archive_file.artifacts.output_path}"
  #   destination = "/tmp/artifacts.zip"
  #   connection {
  #     host        = "${self.public_ip_address}"
  #     type        = "ssh"
  #     user        = "adminuser"
  #     private_key = "${file(var.ssh_private_key_path)}"
  #   }
  # }
}

# ------ Create Compute VM on OCI
resource "oci_core_instance" "oci_compute_instance" {
  provider            = oci.oci
  availability_domain = data.oci_identity_availability_domain.AD.name
  compartment_id      = var.compartment_ocid
  display_name        = var.oci_compute_instance_name
  # image               = var.InstanceImageOCID[var.region]
  shape               = var.InstanceShape

  create_vnic_details {
    subnet_id        = oci_core_subnet.compute_subnet.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    # user_data           = "${base64encode(file("scripts/userdata.tpl"))}"
  }

  source_details {
    source_type = "image"
    source_id   = var.InstanceImageOCID[var.region]
  }

  timeouts {
    create = "10m"
  }
}
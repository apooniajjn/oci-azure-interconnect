## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {
}

variable "user_ocid" {}

variable "region" {
  default = "us-sanjose-1"
}

variable "private_key_path" {
  default = "~/.oci/oci_api_key.pem"
}

variable "compartment_ocid" {
}

variable "ssh_public_key" {
  description = "SSH Public Key String"
}

variable "ssh_private_key_path" {
  default = "~/.ssh/id_oracle"
}

variable "fingerprint" {
}

variable "azure_region" {
}

variable "peering_location" {
}

variable "bandwidth" {
}

variable "InstanceShape" {
  default = "VM.Standard2.1"
}

variable "InstanceImageOCID" {
  type = map

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.4-2018.02.21-1"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaupbfz5f5hdvejulmalhyb6goieolullgkpumorbvxlwkaowglslq"
    us-sanjose-1   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaanwz2yn524lxipjoupop7cjcmy5r4znohz2gbjcxmgzxf4xjs7q3a"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasbx5hzms4eyrs6e3woez6zxxnfd7yuqtc6bg53jiqevoe52ob4qq"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaajlw3xfie2t5t52uegyhiq2npx7bqyu4uvi2zyu3w3mqayc2bxmaa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7d3fsb6272srnftyi4dphdgfjf6gurxqhmv6ileds7ba3m2gltxq"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaa6h6gj6v4n56mqrbgnosskq63blyv2752g36zerymy63cfkojiiq"
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaakuiz2wmx7ticqlfr2skyizauwfv4wasuttoabekqzckjp6ggsnsa"
  }
}

variable "db_password" {
  default = "PAssw0rd_#1234"
}

variable "db_name" {
  default = "customer"
}

variable "pdb_name" {
  default = "custom"
}

variable "oe_data_scale" {
  default = "10"
}

variable "sh_data_scale" {
  default = "10"
}

variable "tp_data_scale" {
  default = "10"
}


variable "azure_express_circuit_name" {
  default = "azure_express_circuit"
}

variable "azure_resource_group_name" {
  default = "azure_oci_arun_test"
}

variable "azure_virtual_network_name" {
  default = "oci_network"
}

variable "gateway_subnet_name" {
  default = "GatewaySubnet"
}

variable "compute_subnet_name" {
  default = "ComputeSubnet"
}

variable "gateway_public_ip_name" {
  default = "GatewayPublicIP"
}

variable "azure_vm_public_ip_name" {
  default = "AzureVMPublicIP"
}

variable "azure_route_table_name" {

  default = "azure_route_table"

}

variable "azure_nsg_name" {
  default = "azure-oci-nsg"
}

variable "virtual_network_gateway_connection_name" {
  default = "azure_to_oci"
}

variable "virtual_network_gateway_name" {
  default = "InterConnectVNETGateway"
}


variable "interconnect_vcn_cidr_block" {
  description = "Interconnect VCN CIDR"
  default     = "10.1.0.0/16"
}


variable "oci_compute_subnet_display_name" {
  description = "Compute Subnet Name"
  default     = "ComputeSubnet"
}

variable "oci_compute_subnet" {
  description = "Compute Subnet CIDR"
  default     = "10.1.10.0/24"
}

variable "oci_compute_subnet_dns_label" {
  description = "Compute Subnet DNS Label"
  default     = "computesubnet"
}


variable "oci_database_subnet_display_name" {
  description = "Compute Subnet Name"
  default     = "DatabaseSubnet"
}

variable "oci_database_subnet" {
  description = "Database Subnet CIDR"
  default     = "10.1.20.0/24"
}

variable "oci_database_subnet_dns_label" {
  description = "Database Subnet DNS Label"
  default     = "databasesubnet"
}

variable "internet_gateway_name" {
  default = "IGW"
}

variable "compute_route_table_display_name" {
  default = "ComputeRouteTable"
}

variable "database_route_table_display_name" {
  default = "DatabaseRouteTable"
}

variable "security_policy_name" {
  default = "AzureSecurityList"
}

variable "oci_compute_instance_name" {
    default = "ComputeVM"
}

### Azure 

variable "azure_vnet_address" {
  default = "10.12.0.0/16"
}

variable "azure_gateway_subnet" {
  default = "10.12.1.0/24"
}

variable "azure_compute_subnet" {
  default = "10.12.2.0/24"
}

variable "azure_compute_vnic_name" {
  default = "compute-vm-nic"
}

variable "azure_compute_machine_name" {
  default = "azure-compute-name"
}
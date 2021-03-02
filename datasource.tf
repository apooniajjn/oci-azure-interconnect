## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Gets a list of Availability Domains
data "oci_identity_availability_domain" "AD" {
  provider            = oci.oci
  compartment_id = var.tenancy_ocid
  ad_number      = "1"
}


data "oci_identity_tenancy" "tenancy" {
  provider            = oci.oci
  tenancy_id = var.tenancy_ocid
}

data "oci_core_fast_connect_provider_services" "test_fast_connect_provider_services" {
    provider            = oci.oci
    compartment_id = var.compartment_ocid
}

data "oci_core_fast_connect_provider_service" "test_fast_connect_provider_service" {
    provider            = oci.oci
    provider_service_id = "${lookup(element(data.oci_core_fast_connect_provider_services.test_fast_connect_provider_services.fast_connect_provider_services, index(data.oci_core_fast_connect_provider_services.test_fast_connect_provider_services.fast_connect_provider_services.*.provider_name, "Microsoft Azure")),"id")}"
}

variable "shape" {
  type = map
  default = {
    10000   = "10 Gbps"
    5000   = "5 Gbps"
    2000   = "2 Gbps"
    1000   = "1 Gbps"
    50     = "1 Gbps" #Test bandwidth
  }
}

# data "archive_file" "artifacts" {
#   type        = "zip"
#   source_dir = "${path.module}/artifacts"
#   output_path = "${path.module}/artifacts.zip"
# }

# data "oci_core_private_ip" "scan_private_ip" {
#     provider            = oci.oci
#     private_ip_id = "${oci_database_db_system.customer_db_system.scan_ip_ids[0]}"
# }

# data "oci_core_vnic" "db1_vnic" {
#    provider            = oci.oci
#    depends_on = [
#    oci_database_db_system.customer_db_system,
#   ]
#     #Required
#     vnic_id = "${lookup(data.oci_database_db_nodes.db_nodes.db_nodes[0],"vnic_id")}"
# }
# data "oci_core_vnic" "db2_vnic" {
#    provider            = oci.oci
#    depends_on = [
#    oci_database_db_system.customer_db_system,
#   ]
#     #Required
#     vnic_id = "${lookup(data.oci_database_db_nodes.db_nodes.db_nodes[1],"vnic_id")}"
# }

# data "oci_database_db_nodes" "db_nodes" {
#     provider            = oci.oci
#        depends_on = [
#    oci_database_db_system.customer_db_system,
#   ]
#     compartment_id = "${var.compartment_ocid}"
#     db_system_id = "${oci_database_db_system.customer_db_system.id}"
# }

data "http" "myip" {
  url = "http://checkip.dyndns.com/"
}
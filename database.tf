## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# # ------ Create Database System 
# resource "oci_database_db_system" "customer_db_system" {
#     provider = oci.oci
#     availability_domain = data.oci_identity_availability_domain.AD.name
#     compartment_id = var.compartment_ocid
#     database_edition = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
#     db_home {
       
#         database {
           
#             admin_password = var.db_password
#             db_name = var.db_name
#             db_workload = "OLTP"
#             ncharacter_set = "UTF8"
#             pdb_name = var.pdb_name
#         }
#         db_version = "12.1.0.2"
#     }
#     hostname = var.db_name
#     shape = "VM.Standard2.4"
#     ssh_public_keys = [var.ssh_public_key]
#     subnet_id = oci_core_subnet.database_subnet.id
#     node_count = "2"
#     data_storage_size_in_gb = "256"
# }

# # display_name = 
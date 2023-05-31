# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#

resource "oci_identity_group" "vision-group" {
  compartment_id = var.tenancy_ocid
  description = "Vision Group"
  name = var.vision_group_name
}

locals {
  policy_statements_basic = [
    "Allow group ${oci_identity_group.vision-group.name} to use ai-service-vision-family in tenancy",
    "Allow group ${oci_identity_group.vision-group.name} to use object-family in tenancy"
  ]
  policy_statements_with_custom_model = [
    "Allow group ${oci_identity_group.vision-group.name} to manage ai-service-vision-family in tenancy",
    "Allow group ${oci_identity_group.vision-group.name} to use object-family in tenancy"
  ]
  policy_statements_with_batch_analysis = [
    "Allow group ${oci_identity_group.vision-group.name} to manage object-family in compartment id ${var.compartment_ocid}"
  ]
}

resource "oci_identity_policy" "vision-root-policy" {
  compartment_id = var.tenancy_ocid
  description = "Vision Root Policies"
  name = var.vision_root_policy_name
  statements = var.use_custom_model == false && var.use_batch_analysis == false ? local.policy_statements_basic : (var.use_custom_model == true && var.use_batch_analysis == false ? local.policy_statements_with_custom_model : (var.use_custom_model == false && var.use_batch_analysis == true ? concat(local.policy_statements_basic, local.policy_statements_with_batch_analysis) : concat(local.policy_statements_with_custom_model, local.policy_statements_with_batch_analysis)))
}

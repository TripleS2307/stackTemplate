# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#

variable "tenancy_ocid" {
  default = ""
}

variable "vision_group_name" {
  default = "VisionGroup"
}

variable "vision_root_policy_name" {
  default = "VisionRootPolicies"
}

variable "use_custom_model" {
  type    = bool
  default = false
}

variable "use_batch_analysis" {
  type    = bool
  default = false
}

variable "compartment_ocid" {
  default = ""
}

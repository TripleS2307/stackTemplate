# Copyright (c) 2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
#

terraform {
  required_providers {

    oci = {
      source = "hashicorp/oci"
    }
    random = {
      source = "hashicorp/random"
    }

  }
  required_version = ">= 0.14"
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
}
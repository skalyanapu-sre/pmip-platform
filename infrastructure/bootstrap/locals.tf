locals {
  # Resource Group name used to store the Terraform remote-state resources.
  #
  # Example:
  # rg-mqgen-tfstate-eus
  resource_group_name = "rg-${var.project}-tfstate-${var.location_short}"

  # Explicit Azure Storage Account name for Terraform remote state.
  #
  # Azure Storage Account naming requirements:
  # - Must be globally unique across Azure.
  # - Must contain only lowercase letters and numbers.
  # - Must be between 3 and 24 characters.
  #
  # This name is intentionally fixed instead of being generated
  # with a random or hash-based suffix.
  storage_account_name = "mqgendev"

  # Blob container used to store Terraform state files.
  #
  # Example state objects:
  # dev.terraform.tfstate
  # prod.terraform.tfstate
  state_container_name = "tfstate"

  # Common tags applied to bootstrap resources.
  #
  # additional_tags allows environment-specific or organizational
  # tags to be merged without changing the base tag set below.
  common_tags = merge(
    {
      project     = upper(var.project)
      environment = var.environment
      managed_by  = "terraform"
      workload    = "terraform-state"
      platform    = "pmip"
      repository  = "pmip-platform"
      data_class  = "internal"
      criticality = "high"
    },
    var.additional_tags
  )
}

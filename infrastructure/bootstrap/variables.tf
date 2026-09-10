variable "subscription_id" {
  description = "Azure subscription ID where PMIP bootstrap resources will be created."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-fA-F-]{36}$", var.subscription_id))
    error_message = "subscription_id must be a valid Azure subscription UUID."
  }
}

variable "project" {
  description = "Short project identifier used in Azure resource naming."
  type        = string
  default     = "pmip"

  validation {
    condition     = can(regex("^[a-z0-9-]{2,12}$", var.project))
    error_message = "project must contain 2-12 lowercase letters, numbers, or hyphens."
  }
}

variable "environment" {
  description = "Environment classification for shared bootstrap infrastructure."
  type        = string
  default     = "shared"

  validation {
    condition     = contains(["shared", "dev", "stage", "prod"], var.environment)
    error_message = "environment must be one of: shared, dev, stage, prod."
  }
}

variable "location" {
  description = "Azure region used for PMIP bootstrap infrastructure."
  type        = string
  default     = "eastus2"
}

variable "location_short" {
  description = "Short Azure region code used in resource naming."
  type        = string
  default     = "eus2"
}

variable "storage_replication_type" {
  description = "Replication strategy for the Terraform state storage account."
  type        = string
  default     = "LRS"

  validation {
    condition = contains([
      "LRS",
      "ZRS",
      "GRS",
      "RAGRS",
      "GZRS",
      "RAGZRS"
    ], var.storage_replication_type)

    error_message = "storage_replication_type must be a supported Azure Storage replication type."
  }
}

variable "blob_soft_delete_days" {
  description = "Number of days deleted Terraform state blobs remain recoverable."
  type        = number
  default     = 30

  validation {
    condition     = var.blob_soft_delete_days >= 7 && var.blob_soft_delete_days <= 365
    error_message = "blob_soft_delete_days must be between 7 and 365."
  }
}

variable "container_soft_delete_days" {
  description = "Number of days deleted Terraform state containers remain recoverable."
  type        = number
  default     = 30

  validation {
    condition     = var.container_soft_delete_days >= 7 && var.container_soft_delete_days <= 365
    error_message = "container_soft_delete_days must be between 7 and 365."
  }
}

variable "additional_tags" {
  description = "Additional Azure tags to merge with mandatory PMIP tags."
  type        = map(string)
  default     = {}
}

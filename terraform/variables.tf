variable "credentials" {
  description = "My Credentials"
  default     = "../.cred.json"
}

variable "project" {
  description = "Project"
  default     = "de-zoomcamp-project-25"
}

variable "region" {
  description = "Region"
  default     = "us-east4"
}

variable "zone" {
  description = "Zone within the region"
  default     = "us-east4-a"
}


variable "location" {
  description = "Project Location"
  default     = "us-east4"
}

variable "bq_dataset_name" {
  description = "US Unemployment Data Historical"
  default = "us_unemployment_data"
}

variable "dbt_stg_us_unemployment" {
  description = "BigQuery dataset for staging"
  default     = "dbt_stg_us_unemployment"
}

variable "dbt_prod_us_unemployment" {
  description = "BigQuery dataset for production"
  default     = "dbt_prod_us_unemployment"
}


variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "de-zoomcamp-25-cm-us-unemployment-data"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

variable "vm_machine_type" {
  type    = string
  default = "e2-standard-2"
}

variable "vm_name" {
  type    = string
  default = "de-zoomcamp-project-vm"
}
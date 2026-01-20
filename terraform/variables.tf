variable "credentials" {
  description = "My Credentials"
  default     = ".keys/service-account.json"
}


variable "project" {
  description = "Project"
  default     = "dtc-de-course-484604"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "ny_taxi_ds_lds"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "ny_taxi_bucket_lds"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
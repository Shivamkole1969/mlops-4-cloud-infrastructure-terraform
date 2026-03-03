variable "project_id" {
  description = "The ID of the GCP Project"
  type        = string
  default     = "my-mlops-project-123"
}

variable "region" {
  description = "GCP Region for deployment"
  type        = string
  default     = "us-central1"
}

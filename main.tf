terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# 1. Google Cloud Storage Bucket for ML artifacts (Model Registry / DVC backend)
resource "google_storage_bucket" "ml_artifacts" {
  name          = "${var.project_id}-ml-artifacts"
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

# 2. Google Kubernetes Engine (GKE) Cluster for Model Training & Serving workloads
resource "google_container_cluster" "primary" {
  name     = "mlops-gke-cluster"
  location = var.region

  # Remove default node pool and use a custom one 
  remove_default_node_pool = true
  initial_node_count       = 1
}

# 3. Dedicated Node Pool for ML Workloads
resource "google_container_node_pool" "primary_nodes" {
  name       = "ml-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    machine_type = "e2-standard-4" # Solid choice for typical CPU based ML Serving
    
    # In a real environment you would assign specific IAM roles
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }
}

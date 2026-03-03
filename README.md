# Cloud Infrastructure for ML (IaC)

## 🌟 STAR Summary

- **Situation:** Data Science and Engineering teams were manually configuring environments across GCP and Azure (Compute instances, Storage buckets, Virtual Networks). This manual setup led to configuration drift, excessive costs from unused zombie instances, and security vulnerabilities due to non-standardized permissions.
- **Task:** Architect and implement scalable, cost-effective, and secure cloud infrastructure using Infrastructure as Code (IaC) principles to seamlessly provision the underlying environments for ML model training, artifact storage, and Kubernetes model serving.
- **Action:** 
  1. **Infrastructure as Code (IaC):** Adopted **Terraform** as the unified tool to provision cloud resources across environments.
  2. **GCP Core Resources:** Wrote modular configurations (ex. `main.tf`, `variables.tf`) to instantiate a scalable Google Kubernetes Engine (**GKE**) cluster tailored for ML workloads alongside Google Cloud Storage (**GCS**) buckets designed to store versioned data (DVC backend) and serialized models persistently.
  3. **Security & Reproducibility:** Bound Identity and Access Management (IAM) scopes programmatically to limit cluster access to only required services, eliminating misconfigurations and enforcing best practices per cloud provider recommendations.
- **Result:** Minimized the infrastructural setup time for a new ML domain from several weeks to minutes. Eliminated cross-environment discrepancies (Dev vs. Prod) and provided clear audit trails for all structural modifications handling sensitive MLOps workloads, directly optimizing resource costs.

## 🛠 Tech Stack Used (MLOps Alignment)
*   **Infrastructure as Code:** Terraform
*   **Cloud Provider:** Google Cloud Platform (GCP)
*   **Managed Services:** Google Kubernetes Engine (GKE), Google Cloud Storage (GCS)
*   **Security:** Cloud IAM provisioning

## 🚀 How to Run Locally

You must have the Terraform CLI and Google Cloud SDK (`gcloud`) installed locally.

1. Initialize Terraform (Downloads provider plugins):
   ```bash
   terraform init
   ```
2. View the execution plan (Dry-Run):
   ```bash
   terraform plan
   ```
3. Apply the infrastructure changes (Actually provisions resources):
   ```bash
   terraform apply
   ```

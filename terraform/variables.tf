variable "project_id" {
  description = "GCP Project ID"
  default     = "m300-gitea"
}

variable "region" {
  description = "GCP Region (für VPC, Subnet, DNS)"
  default     = "europe-west1"
}

variable "zone" {
  description = "GCP Zone (für GKE Cluster und Filestore)"
  default     = "europe-west1-b"
}

variable "cluster_name" {
  description = "Name des GKE Clusters"
  default     = "gitea-cluster"
}

variable "node_count" {
  description = "Anzahl Nodes im Cluster"
  default     = 3
}

variable "machine_type" {
  description = "VM Typ für die Nodes"
  default     = "e2-standard-2"
}
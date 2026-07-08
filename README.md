# M300 – Hochverfügbares Gitea auf GCP mit Kubernetes

Dieses Repository enthält die Infrastruktur- und Konfigurationsdateien 
für das Modul-300-Schulprojekt von Luka Vukadin.

## Projektübersicht
- **Cloud:** Google Cloud Platform (GCP)
- **Cluster:** Google Kubernetes Engine (GKE)
- **Applikation:** Gitea (selbst-gehosteter Git-Service)
- **Domain:** https://git.lukavukadin.ch
- **Projektvariante:** V2

## Ordnerstruktur

### [`terraform/`](terraform/)
Infrastruktur als Code — erstellt die gesamte GCP-Umgebung.
- [`main.tf`](terraform/main.tf) – VPC, Subnetz, GKE-Cluster, Node-Pool, Cloud DNS Zone, Filestore
- [`variables.tf`](terraform/variables.tf) – Konfigurationsvariablen (Region, Zone, Maschinentyp etc.)
- [`outputs.tf`](terraform/outputs.tf) – Outputs nach dem Deploy (Cluster-Name, Filestore-IP, DNS-Nameserver)

### [`kubernetes/`](kubernetes/)
Kubernetes- und Helm-Konfigurationen für die Anwendungen.
- [`gitea-values.yaml`](kubernetes/gitea-values.yaml) – Helm-Konfiguration für Gitea (Ingress, TLS, DB-Verbindung, HPA)
- [`postgres-cluster.yaml`](kubernetes/postgres-cluster.yaml) – CloudNativePG PostgreSQL-Cluster (1 Primary + 2 Replicas)
- [`cluster-issuer.yaml`](kubernetes/cluster-issuer.yaml) – cert-manager ClusterIssuer für Let's Encrypt TLS-Zertifikate
- [`gitea-pv.yaml`](kubernetes/gitea-pv.yaml) – Manuell erstelltes PersistentVolume für GCP Filestore (RWX)
- [`grafana-ingress.yaml`](kubernetes/grafana-ingress.yaml) – Ingress für Grafana unter grafana.lukavukadin.ch

### [`.github/workflows/`](.github/workflows/)
CI/CD Pipeline mit GitHub Actions.
- [`deploy.yml`](.github/workflows/deploy.yml) – Automatisches Gitea-Deployment bei Push auf `main` (Workload Identity Federation)
module "flux-gke" {
    source = "./modules/flux-gke"

    project_id = var.project_id
    cluster_name = var.cluster_name
    cluster_region = var.cluster_region

    github_owner = "marcinkubica"
    github_token = file("../../../.secrets/GITHUB_TOKEN")

    repository_name = "flux-playground"
    github_deploy_key_title = "marcin-fluxcd-playground"
    target_path = "./clusters/eso"
}

module "gke_auth" {
  source               = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  project_id           = var.project_id
  cluster_name         = var.cluster_name
  location             = var.cluster_region
  use_private_endpoint = var.use_private_endpoint
}
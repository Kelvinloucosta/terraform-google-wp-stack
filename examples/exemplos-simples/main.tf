terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.81.0"
    }
  }

  backend "gcs" {
    credentials = "sa-tf-key.json"
    bucket      = "kelvinloucosta-tf-manually"
    prefix      = "terraform/vm-state"
    project     = "gavb-lab-kelvin-costa"
  }

}

provider "google" {
  # Configuration options
  project     = "gavb-lab-kelvin-costa"
  region      = var.region
  zone        = var.zone
  credentials = "sa-tf-key.json"
}

module "wp_stack" {
  source  = "Kelvinloucosta/wp-stack/google"
  version = "1.0.0"
  zone          = var.zone
  region        = var.region
  publickeypath = google_os_login_ssh_public_key.ssh.fingerprint
  wp_vms_count  = var.wp_vms_count
}

data "google_client_openid_userinfo" "me" {
}

resource "google_os_login_ssh_public_key" "ssh" {
  user = data.google_client_openid_userinfo.me.email
  key  = file(var.ssh)
}






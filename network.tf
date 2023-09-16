resource "google_compute_global_address" "pip_01" {
  name       = "lb-ipv4-1"
  ip_version = "IPV4"
}

resource "google_compute_network" "custom-vpc-tf" {
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name                     = "sub-sg"
  network                  = google_compute_network.custom-vpc-tf.id
  ip_cidr_range            = "10.1.0.0/24"
  region                   = var.region
  private_ip_google_access = true

}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "tcp"
    ports    = [22, 80]
  }
  source_ranges = ["0.0.0.0/0"]
  priority      = 100
}


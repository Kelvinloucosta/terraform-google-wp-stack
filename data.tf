data "google_compute_network" "custom_vpc" {
  name = "custom-vpc-tf"
}

data "google_compute_subnetwork" "sub_sg" {
  name = "sub-sg"
}
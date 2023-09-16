resource "google_compute_instance_template" "instance_template" {
  name = "lb-backend-template"
  disk {
    auto_delete  = true
    boot         = true
    device_name  = "persistent-disk-01"
    mode         = "READ_WRITE"
    source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    type         = "PERSISTENT"
  }
  labels = {
    managed-by-cnrm = "true"
  }
  machine_type = var.type_vm

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }
    network    = data.google_compute_network.custom_vpc.name
    subnetwork = data.google_compute_subnetwork.sub_sg.name
  }
  region = var.region
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "default"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/pubsub", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["allow-health-check"]
}
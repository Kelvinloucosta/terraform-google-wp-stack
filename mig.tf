resource "google_compute_instance_group_manager" "mig" {
  name = "lb-backend-mig"
  zone = var.zone
  named_port {
    name = "http"
    port = 80
  }
  version {
    instance_template = google_compute_instance_template.instance_template.id // Mencioar Instance Template
    name              = "primary"
  }
  base_instance_name = var.instance_name_prefix
  target_size        = var.wp_vms_count
}
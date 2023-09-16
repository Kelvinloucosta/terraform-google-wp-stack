resource "google_compute_instance" "vm-from-tf" {
  name         = "vm-nfs"
  zone         = var.zone
  machine_type = var.type_vm
  count        = var.vms_count

  allow_stopping_for_update = true // Quando for mudar o size da maquina essa opcao tem que esta habilitada para isso

  network_interface {
    network    = data.google_compute_network.custom_vpc.name
    subnetwork = data.google_compute_subnetwork.sub_sg.name

    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    enable-oslogin     = "FALSE"
    enable-oslogin-2fa = "FALSE"
    ssh-keys = "${var.user}:${var.publickeypath}"

  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230908"
      size  = 35

    }
    auto_delete = false
  }

  labels = {
    "env" = "hands-on-modulo"
  }

  scheduling {
    preemptible       = false
    automatic_restart = false
  }

  service_account {
    email  = "terraform-gcp@gavb-lab-kelvin-costa.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }



  depends_on = [google_compute_network.custom-vpc-tf]

}
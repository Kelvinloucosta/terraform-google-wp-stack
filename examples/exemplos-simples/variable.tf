variable "zone" {
  default     = "us-central1-a"
  type        = string
  description = "location of the VMs"
}

variable "region" {
  default     = "us-central1"
  type        = string
  description = "location of the VMs"
}

variable "ssh" {
  type    = string
  default = "~/.ssh/vm_gcp.pub"
}

variable "wp_vms_count" {
  default     = 2
  type        = number
  description = "Number of VMs"
  validation {
    condition     = var.wp_vms_count > 1
    error_message = "O numero minimo de máquina são 2"
  }

}
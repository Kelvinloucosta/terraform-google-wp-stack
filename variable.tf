variable "instance_name_prefix" {
  description = "Prefix for VM instance names"
  type        = string
  default     = "my-vm-instance"
}

variable "zone" {
  default     = "us-central1-a"
  type        = string
  description = "location of the VMs"
}

variable "vm_name" {
  default     = "vm-lab-tf"
  type        = string
  description = "name of the VMs"
}

variable "vms_count" {
  default     = 1
  type        = number
  description = "Number of VMs"

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

variable "region" {
  default     = "us-central1"
  type        = string
  description = "location of the VMs"
}

variable "type_vm" {
  default     = "n1-standard-2"
  type        = string
  description = "VMs specifications"
}

variable "user" {
  type    = string
  default = "kcosta"
}

variable "publickeypath" {
  type    = string
  description = "Chave SSH para as maquinas"
}
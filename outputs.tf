output "load_balancer_ip" {
  value       = google_compute_global_address.pip_01.address
  description = "Ip do LB"
}

output "wp_vm_ips" {
  value       = google_compute_instance.vm-from-tf[0].network_interface[0].access_config[0].nat_ip
  description = "Ip das maquinas"
}

output "sql_user" {
  value       = google_sql_user.users.name
  description = "User of the Mysql"
}

output "sql_password" {
  value     = google_sql_user.users.password
  sensitive = true
}
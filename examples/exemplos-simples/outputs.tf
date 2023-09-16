output "stack-load_balancer_ip" {
  value       = module.wp_stack.load_balancer_ip
  description = "Ip do LB"
}

output "stack-wp_vm_ips" {
  value       = module.wp_stack.wp_vm_ips
  description = "Ip das maquinas"
}

output "stack-sql_user" {
  value       = module.wp_stack.sql_user
  description = "User of the Mysql"
}

output "stack-sql_password" {
  value     = module.wp_stack.sql_password
  sensitive = true
}
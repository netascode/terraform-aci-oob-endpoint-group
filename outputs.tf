output "dn" {
  value       = aci_rest.mgmtOoB.id
  description = "Distinguished name of `mgmtOoB` object."
}

output "name" {
  value       = aci_rest.mgmtOoB.content.name
  description = "OOB endpoint group name."
}

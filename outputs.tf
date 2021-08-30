output "hosts" {
  value = merge(
    module.keycloak.hosts,
  )
}

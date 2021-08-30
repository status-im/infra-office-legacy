output "hosts" {
  value = merge(
    module.keycloak.hosts,
    module.nextcloud.hosts,
  )
}

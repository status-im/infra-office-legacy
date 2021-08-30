output "hosts" {
  value = merge(
    module.gitea.hosts,
    module.keycloak.hosts,
    module.nextcloud.hosts,
  )
}

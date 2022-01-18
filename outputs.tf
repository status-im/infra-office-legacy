output "hosts" {
  value = merge(
    module.crm.hosts,
    module.gitea.hosts,
    module.keycloak.hosts,
    module.nextcloud.hosts,
    module.todo.hosts,
  )
}

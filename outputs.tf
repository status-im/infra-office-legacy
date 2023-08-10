output "hosts" {
  value = merge(
    module.gitea.hosts,
    module.keycloak.hosts,
    module.todo.hosts,
    module.wekan.hosts,
  )
}

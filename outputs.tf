output "hosts" {
  value = merge(
    module.gitea.hosts,
    module.todo.hosts,
  )
}

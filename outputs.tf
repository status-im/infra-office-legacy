output "hosts" {
  value = merge(
    module.todo.hosts,
  )
}

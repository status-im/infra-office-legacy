/* Various productivity tools ------------------*/
module "todo" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "todo"
  group  = "todo"
  type   = "s-2vcpu-4gb"

  open_tcp_ports = ["80", "443"]
}

/* Octobox */
resource "cloudflare_record" "octobox" {
  zone_id = local.zones["status.im"]
  name    = "gh"
  type    = "A"
  proxied = true
  value   = module.todo.public_ips[0]
}

/* HackMD */
resource "cloudflare_record" "notes" {
  zone_id = local.zones["status.im"]
  name    = "notes"
  type    = "A"
  proxied = true
  value   = module.todo.public_ips[0]
}

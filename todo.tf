/* Various productivity tools ------------------*/

module "todo" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 1
  env        = "todo"
  group      = "todo"
  size       = "s-2vcpu-4gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "octobox" {
  zone_id = local.zones["status.im"]
  name    = "gh"
  type    = "A"
  proxied = true
  value   = module.todo.public_ips[0]
}

/* Wekan Board */
resource "cloudflare_record" "boards" {
  zone_id = local.zones["status.im"]
  name    = "boards"
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

/* ShLink */
resource "cloudflare_record" "link" {
  zone_id = local.zones["status.im"]
  name    = "link"
  type    = "A"
  proxied = true
  value   = module.todo.public_ips[0]
}

resource "cloudflare_record" "admin_link" {
  zone_id = local.zones["status.im"]
  name    = "admin-link"
  type    = "A"
  proxied = true
  value   = module.todo.public_ips[0]
}

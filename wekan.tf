module "wekan" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "wekan"
  group  = "wekan"
  type   = "m-1vcpu-8gb"
  domain = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "boards" {
  zone_id = local.zones["status.im"]
  name    = "boards"
  type    = "A"
  proxied = true
  value   = module.wekan.public_ips[0]
}

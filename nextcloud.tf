module "nextcloud" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "nextcloud"
  group  = "nextcloud"
  type   = "s-4vcpu-8gb"
  domain = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "nextcloud" {
  zone_id = local.zones["status.im"]
  value   = module.nextcloud.public_ips[0]
  name    = "cloud"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "onlyoffice" {
  zone_id = local.zones["status.im"]
  value   = module.nextcloud.public_ips[0]
  name    = "onlyoffice"
  type    = "A"
  proxied = true
}

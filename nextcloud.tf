module "nextcloud" {
  source     = "github.com/status-im/infra-tf-digital-ocean"
  host_count = 1
  env        = "nextcloud"
  group      = "nextcloud"
  size       = "s-2vcpu-4gb"
  domain     = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "nextcloud" {
  zone_id = local.zones["status.im"]
  value   = module.nextcloud.public_ips[0]
  name    = "cloud"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "collabora" {
  zone_id = local.zones["status.im"]
  value   = module.nextcloud.public_ips[0]
  name    = "collabora"
  type    = "A"
  proxied = true
}

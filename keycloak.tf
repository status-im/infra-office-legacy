module "keycloak" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "keycloak"
  group  = "keycloak"
  type   = "s-1vcpu-2gb"
  domain = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "keycloak" {
  zone_id = local.zones["status.im"]
  value   = module.keycloak.public_ips[0]
  name    = "keycloak.infra"
  type    = "A"
  proxied = true
}

/* Domain for status-im Keycloak realm. */
resource "cloudflare_record" "auth" {
  zone_id = local.zones["status.im"]
  value   = module.keycloak.public_ips[0]
  name    = "auth"
  type    = "A"
  proxied = true
}

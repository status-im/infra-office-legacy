/* Ambassador Program CRM */

module "crm" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "crm"
  group  = "crm"
  type   = "s-2vcpu-4gb"
  domain = var.domain

  open_tcp_ports = ["80", "443"]
}

resource "cloudflare_record" "crm" {
  zone_id = local.zones["status.im"]
  name    = "admin-ambassador"
  type    = "A"
  proxied = true
  value   = module.crm.public_ips[0]
}

/* Various productivity tools ------------------*/

module "gitea" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "gitea"
  group  = "gitea"
  type   = "s-1vcpu-2gb"
  domain = var.domain

  data_vol_size = 30

  open_tcp_ports = ["80", "443", "2222"]
}

resource "cloudflare_record" "repos" {
  zone_id = local.zones["status.im"]
  name    = "repos"
  type    = "A"
  proxied = true
  value   = module.gitea.public_ips[0]
}

/* This allows us changing the default 22 port for OpenSSH on the host. */
resource "digitalocean_loadbalancer" "git" {
  name   = "git-lb"
  region = "ams3"
  size   = "lb-small"

  forwarding_rule {
    entry_port     = 22
    entry_protocol = "tcp"

    target_port     = 2222
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = values(module.gitea.ids)
}

resource "cloudflare_record" "git" {
  zone_id = local.zones["status.im"]
  name    = "git"
  type    = "A"
  proxied = false
  value   = digitalocean_loadbalancer.git.ip
}

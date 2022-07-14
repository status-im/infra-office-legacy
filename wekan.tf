module "wekan" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  env    = "wekan"
  group  = "wekan"
  type   = "s-2vcpu-4gb"
  domain = var.domain

  open_tcp_ports = ["80", "443"]
}

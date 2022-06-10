terraform {
  required_version = "~> 1.2.0"
  required_providers {
    pass = {
      source  = "camptocamp/pass"
      version = " = 2.0.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = " = 2.21.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

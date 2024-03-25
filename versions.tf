terraform {
  required_version = "> 1.4.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    pass = {
      source  = "camptocamp/pass"
      version = "= 2.0.0"
    }
  }
}

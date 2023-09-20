locals {
  ddos_protected = [
    { domain = "cloud.status.im", paused = true },
    { domain = "notes.status.im", paused = true },
    { domain = "repos.status.im", paused = false },
  ]
}

resource "cloudflare_filter" "domain_filter" {
  zone_id     = local.zones["status.im"]
  description = "Filter: ${local.ddos_protected[count.index].domain}"
  expression  = "( http.host eq \"${local.ddos_protected[count.index].domain}\" )"
  count       = length(local.ddos_protected)
}

/* This deploys DDOS protection for discuss.status.im.
 * https://www.terraform.io/docs/providers/cloudflare/r/firewall_rule.html */
resource "cloudflare_firewall_rule" "ddos_protection" {
  zone_id     = local.zones["status.im"]
  description = "DDOS Protection: ${local.ddos_protected[count.index].domain}"
  filter_id   = cloudflare_filter.domain_filter[count.index].id
  action      = "js_challenge" /* 'challenge' is a more manual check */
  paused      = local.ddos_protected[count.index].paused
  count       = length(local.ddos_protected)
}

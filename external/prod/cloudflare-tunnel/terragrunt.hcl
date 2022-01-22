terraform {
  source = "../..//modules/cloudflare-tunnel"
}

inputs = {
  name = "homelab-tunnel"
  inject_secrets = true
}

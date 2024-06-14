#!/usr/bin/env bash
echo "Headlessly provisioning a Linux / macOS / Unix machine"
export HEADLESS_INSTALL=true
export SOFTWARE_GROUP="Standard-Desktop"
export FULL_NAME="Johan Weitner"
export PUBLIC_SERVICES_DOMAIN="johan.weitner"
export CLOUDFLARE_API_TOKEN=""
export TAILSCALE_AUTH_KEY="tailscale-auth-key-xXP999kUu888777"
export START_REPO="johan-weitner/install.doctor"
curl -sSL "https://install.doctor/start" | bash

#!/usr/bin/env bash
export HEADLESS_INSTALL=true
export SOFTWARE_GROUP=Standard-Desktop
export FULL_NAME="Johan Weitner"
export PRIMARY_EMAIL="johanweitner@gmail.com"
export PUBLIC_SERVICES_DOMAIN="johan.weitner"
export START_REPO=johan-weitner/install.doctor
qvm-run --pass-io sys-firewall "curl -sSL https://install.doctor/qubes" > ~/setup.sh
bash ~/setup.sh
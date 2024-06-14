#!/usr/bin/env bash
export START_REPO=johan-weitner/install.doctor
qvm-run --pass-io sys-firewall "curl -sSL https://install.doctor/qubes" > ~/setup.sh
bash ~/setup.sh
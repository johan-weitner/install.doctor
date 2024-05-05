#!/usr/bin/env bash
# @file Endlessh Configuration
# @brief Applies the Endlessh configuration and starts the service on Linux systems

function configureEndlessh() {
  ### Update the service configuration file
  logg info 'Updating endlessh service configuration file'
  sudo sed -i 's/^.*#AmbientCapabilities=CAP_NET_BIND_SERVICE/AmbientCapabilities=CAP_NET_BIND_SERVICE/' /usr/lib/systemd/system/endlessh.service
  sudo sed -i 's/^.*PrivateUsers=true/#PrivateUsers=true/' /usr/lib/systemd/system/endlessh.service
  logg info 'Reloading systemd' && sudo systemctl daemon-reload
  ### Update capabilities of `endlessh`
  logg info 'Updating capabilities of endlessh' && sudo setcap 'cap_net_bind_service=+ep' /usr/bin/endlessh
  ### Restart / enable Endlessh
  logg info 'Enabling the endlessh service' && sudo systemctl enable endlessh
  logg info 'Restarting the endlessh service' && sudo systemctl restart endlessh
}

### Update /etc/endlessh/config if environment is not WSL
if [[ ! "$(test -d proc && grep Microsoft /proc/version > /dev/null)" ]]; then
  if command -v endlessh > /dev/null; then
    if [ -d /etc/endlessh ]; then
      logg info 'Copying ~/.ssh/endlessh/config to /etc/endlessh/config' && sudo cp -f "$HOME/.ssh/endlessh/config" /etc/endlessh/config
      configureEndlessh || CONFIGURE_EXIT_CODE=$?
      if [ -n "$CONFIGURE_EXIT_CODE" ]; then
        logg error 'Configuring endlessh service failed' && exit 1
      else
        logg success 'Successfully configured endlessh service'
      fi
    elif [ -f /etc/endlessh.conf ]; then
      logg info 'Copying ~/.ssh/endlessh/config to /etc/endlessh.conf' && sudo cp -f "$HOME/.ssh/endlessh/config" /etc/endlessh.conf
      configureEndlessh || CONFIGURE_EXIT_CODE=$?
      if [ -n "$CONFIGURE_EXIT_CODE" ]; then
        logg error 'Configuring endlessh service failed' && exit 1
      else
        logg success 'Successfully configured endlessh service'
      fi
    else
      logg warn 'Neither the /etc/endlessh folder nor the /etc/endlessh.conf file exist'
    fi
  else
    logg info 'Skipping Endlessh configuration because the endlessh executable is not available in the PATH'
  fi
else
  logg info 'Skipping Endlessh configuration since environment is WSL'
fi
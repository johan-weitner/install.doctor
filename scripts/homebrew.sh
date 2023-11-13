#!/usr/bin/env bash
# @file Homebrew Install
# @brief Installs Homebrew on macOS and / or Linux.
# @description
#     This script installs Homebrew on macOS and/or Linux machines. The script:
#
#     1. Ensures Homebrew is not already installed
#     2. Installs Homebrew headlessly if sudo privileges are already given
#     3. Prompts for the sudo password, if required
#     4. Performs some clean up and update tasks when the Homebrew installation reports an error
#
#     **Note**: `https://install.doctor/brew` points to this file.

if ! command -v brew > /dev/null; then
  if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
    logg info "Sourcing from /home/linuxbrew/.linuxbrew/bin/brew" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    if ! command -v brew > /dev/null; then
      logg error "The /home/linuxbrew/.linuxbrew directory exists but something is not right. Try removing it and running the script again." && exit 1
    fi
  elif [ -d "$HOME/.linuxbrew" ]; then
    logg info "Sourcing from $HOME/.linuxbrew/bin/brew" && eval "$($HOME/.linuxbrew/bin/brew shellenv)"
    if ! command -v brew > /dev/null; then
      logg error "The $HOME/.linuxbrew directory exists but something is not right. Try removing it and running the script again." && exit 1
    fi
  else
    ### Installs Homebrew and addresses a couple potential issues
    if command -v sudo > /dev/null && sudo -n true; then
      logg info "Installing Homebrew"
      echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      logg info "Homebrew is not installed. The script will attempt to install Homebrew and you might be prompted for your password."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || BREW_EXIT_CODE="$?"
      if [ -n "$BREW_EXIT_CODE" ]; then
        if command -v brew > /dev/null; then
          logg warn "Homebrew was installed but part of the installation failed. Trying a few things to fix the installation.."
          BREW_DIRS="share/man share/doc share/zsh/site-functions etc/bash_completion.d"
          for BREW_DIR in $BREW_DIRS; do
            if [ -d "$(brew --prefix)/$BREW_DIR" ]; then
              logg info "Chowning $(brew --prefix)/$BREW_DIR" && sudo chown -R "$(whoami)" "$(brew --prefix)/$BREW_DIR"
            fi
          done
          logg info "Running brew update --force --quiet" && brew update --force --quiet && logg success "Successfully ran brew update --force --quiet"
        fi
      fi
    fi

    ### Ensures the `brew` binary is available on Linux machines. macOS installs `brew` into the default `PATH` so nothing needs to be done for macOS.
    if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
      logg info "Sourcing shellenv from /home/linuxbrew/.linuxbrew/bin/brew" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [ -f /opt/homebrew/bin/brew ]; then
      logg info "Sourcing shellenv from /opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi
fi

### Ensure GCC is installed via Homebrew
if command -v brew > /dev/null; then
  if ! brew list | grep gcc > /dev/null; then
    logg info "Installing Homebrew gcc" && brew install gcc
  fi
else
  logg error "Failed to initialize Homebrew" && exit 2
fi

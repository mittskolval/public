#!/bin/bash

main() {
  local gh_email ssh_key_path answer

  ssh_key_path="$HOME/.ssh/id_rsa"

  [ ! -f "$ssh_key_path" ] && {
    echo;echo "*** Setting up SSH key ***"
    echo -n "Enter your GitHub e-mail: "
    read -r gh_email

    ssh-keygen -t ed25519 -a 100 -C "$gh_email" -f "$ssh_key_path" -N "" &>/dev/null || {
      echo "Could not generate SSH key"
      exit 1
    }
  }

  echo "Copy the key below to a new SSH key on GitHub -> https://github.com/settings/keys"
  echo
  cat "${ssh_key_path}.pub"
}

main

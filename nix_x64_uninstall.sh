#!/bin/zsh

# Check if running under Rosetta 2
if [[ $(uname -m) != "x86_64" ]]; then
  echo "This script needs to be run in an x86_64 shell using Rosetta 2."
  echo "Automatically restarting the script with Rosetta 2..."
  script_name=$(basename "$0")
  arch -x86_64 /bin/zsh ./$script_name
  exit 0
fi

# Define the installation directory
NIX_X64_DIR="$HOME/nix-x64"

# Check if the Nix installation directory exists
if [[ -d $NIX_X64_DIR ]]; then
  echo "Removing Nix installation from $NIX_X64_DIR..."
  
  # Uninstall Nix
  rm -rf $NIX_X64_DIR
  
  # Verify the uninstallation
  if [[ ! -d $NIX_X64_DIR ]]; then
    echo "Nix was successfully uninstalled from $NIX_X64_DIR."
  else
    echo "There was an error uninstalling Nix."
    exit 1
  fi
else
  echo "Nix is not installed in $NIX_X64_DIR."
fi

echo "Nix uninstallation process completed."

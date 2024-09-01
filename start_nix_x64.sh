#!/bin/zsh

# Check if running under Rosetta 2
if [[ $(uname -m) != "x86_64" ]]; then
  echo "This script needs to be run in an x86_64 shell using Rosetta 2."
  echo
  echo "arch -x86_64 /bin/zsh ./start_nix_x64.sh"
  exit 1
fi

# Define the installation directory
NIX_X64_DIR="$HOME/nix-x64"

# Create the installation directory if it doesn't exist
mkdir -p $NIX_X64_DIR

# Download and install Nix into the specified directory
echo "Installing Nix into $NIX_X64_DIR..."
curl -L https://nixos.org/nix/install | bash -s -- --daemon --no-modify-profile --prefix $NIX_X64_DIR

# Source the Nix environment for the current session
echo "Configuring the Nix environment..."
if [[ -f $NIX_X64_DIR/etc/profile.d/nix.sh ]]; then
  source $NIX_X64_DIR/etc/profile.d/nix.sh
fi

# Verify the installation
echo "Verifying the Nix installation..."
if command -v nix >/dev/null 2>&1; then
  echo "Nix was successfully installed in $NIX_X64_DIR."
else
  echo "There was an error installing Nix."
  exit 1
fi

# Start a nix-shell in x86_64 mode immediately
echo "Starting nix-shell in x86_64 mode..."
nix-shell

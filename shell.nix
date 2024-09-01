{ pkgs ? import <nixpkgs> { system = "x86_64-darwin"; } }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.gcc ];
  buildInputs = [
    # Add any other packages you need here, e.g., pkgs.cmake, pkgs.pkg-config
  ];
}

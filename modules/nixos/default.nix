{ inputs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./chromium.nix
    ./desktop.nix
    ./fonts.nix
    ./keyring.nix
    ./language.nix
    ./network.nix
    ./nix.nix
    ./power.nix
  ];
}

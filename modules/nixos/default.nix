{ inputs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./fonts.nix
    ./keyring.nix
    ./language.nix
    ./network.nix
    ./nix.nix
    ./power.nix
  ];
}

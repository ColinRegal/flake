{ pkgs, ... }:

{

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coco = {
    isNormalUser = true;
    description = "coco";
    useDefaultShell = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
    packages = with pkgs; [
      openrgb-with-all-plugins
      signal-desktop
      bitwarden-desktop
    ];
  };

}

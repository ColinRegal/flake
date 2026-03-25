{ pkgs, ... }:

{

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coco = {
    isNormalUser = true;
    description = "coco";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
  };

}

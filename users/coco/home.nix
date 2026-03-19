{ pkgs, ... }:

{

  home.stateVersion = "25.11";

  home = {
    username = "coco";
    homeDirectory = "/home/coco";
  };

  catppuccin = {
    enable = true;
    flavor = "latte";
  };

  programs.ghostty.enable = true;

  programs.alacritty.enable = true;

  programs.chromium.enable = true;

  programs.anki = {
    enable = true;
    addons = [
      pkgs.ankiAddons.passfail2
      pkgs.ankiAddons.anki-connect
    ];
  };

  home.packages = with pkgs; [
    discord
  ];

  programs.zsh = {
    enable = true;

    plugins = [

    ];
  };

}

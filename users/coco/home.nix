{
  pkgs,
  ...
}:

{
  home.stateVersion = "25.11";

  home = {
    username = "coco";
    homeDirectory = "/home/coco";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "ghostty";
  };

  home.packages = with pkgs; [
    bitwarden-desktop
    catppuccin-discord
    discord
    fastfetch
    openrgb-with-all-plugins
    signal-desktop
    silver-searcher
    vscode
  ];

}

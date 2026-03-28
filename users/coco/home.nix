{
  pkgs,
  inputs,
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
    QT_QPA_PLATFORMTHEME="gtk3";

  };

  home.packages = with pkgs; [
    bitwarden-desktop
    discord
    fastfetch
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    python314
    qimgv
    signal-desktop
    silver-searcher
    vscode
    xdg-desktop-portal-gtk
  ];

}

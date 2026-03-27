{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    imports = [
      ./snacks.nix
    ];
    enable = true;
    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
    opts = {
      # Use system clipboard
      clipboard = "unnamedplus";

      # Tabuluation settings
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      number = true;
      wrap = true;

    };
    plugins = {
      # UI plugins
      noice.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;
      bufferline.enable = true;

      cmp.enable = true;
    };
  };
}

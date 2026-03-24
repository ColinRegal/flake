{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    opts = {
    # Use system clipboard 
	clipboard = "unnamedplus";

	# Tabuluation settings
	tabstop = 4;
	softtabstop = 4;
	shiftwidth = 4;
	expandtab = true;
    };
  };
}

{ pkgs, ... }:

{

  home.stateVersion = "25.11";

  home = {
    username = "coco";
    homeDirectory = "/home/coco";
  };

  home.sessionVariables = {
    EDITOR = "vim";
    TERM = "ghostty";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.ghostty.enable = true;

  programs.alacritty.enable = true;

  programs.chromium.enable = true;

  programs.btop.enable = true;

  programs.anki = {
    enable = true;
    language = "fr_FR";
    sync.autoSync = true;
    addons = [
      pkgs.ankiAddons.passfail2
      pkgs.ankiAddons.anki-connect
    ];
  };

  home.packages = with pkgs; [
    discord
    rofi
    hyprlock
    hyprpanel
    hyprlauncher
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [

    ];
  };

  programs.starship = {
    enable = true;
    # Configuration écrite dans ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      extraConfig = ''
     	input {
            	kb_layout = fr
            	kb_variant =
      		kb_model =
       		kb_options =
            	kb_rules =

            	follow_mouse = 1

            	sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

            	touchpad {
                	natural_scroll = false
            	}
        }

	"$mod" = "ALT";

	# Misc
        $mod, R, exec, hyprlauncher
       	$mod, T, exec, ghostty
        $mod, F, exec, fullscreen
        $mod, A, exec, killactive
		
	# Windows managing
        $mod, left, movefocus, l
       	$mod, right, movefocus, r
        $mod, up, movefocus, u
        $mod, down, movefocus, d

	# Workspace managing
        $mod, 1, workspace, &
        $mod, 2, workspace, é
        $mod, 3, workspace, 3
        $mod, 4, workspace, 4
        $mod, 5, workspace, (
        $mod, 6, workspace, -
        $mod, 7, workspace, è
        $mod, 8, workspace, _
        $mod, 9, workspace, ç
        $mod, 0, workspace, à

        $mod SHIFT, 1, movetoworkspace, &
        $mod SHIFT, 2, movetoworkspace, é
        $mod SHIFT, 3, movetoworkspace, 3
        $mod SHIFT, 4, movetoworkspace, 4
        $mod SHIFT, 5, movetoworkspace, (
        $mod SHIFT, 6, movetoworkspace, -
        $mod SHIFT, 7, movetoworkspace, è
        $mod SHIFT, 8, movetoworkspace, _
        $mod SHIFT, 9, movetoworkspace, ç
        $mod SHIFT, 0, movetoworkspace, à
      '';
    };
  };

}

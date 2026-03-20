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

    extraConfig = ''
            	input {
		kb_layout = us
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
            	$mod = ALT

            	# Misc
            	bind = $mod, R, exec, hyprlauncher
            	bind = $mod, T, exec, ghostty
            	bind = $mod, F, exec, fullscreen
            	bind = $mod, A, exec, killactive
                                		
            	# Windows managing
            	bind = $mod, left, movefocus, l
            	bind = $mod, right, movefocus, r
            	bind = $mod, up, movefocus, u
            	bind = $mod, down, movefocus, d

            	# Workspace managing
            	bind = $mod, 1, workspace, &
            	bind = $mod, 2, workspace, é
            	bind = $mod, 3, workspace, 3
            	bind = $mod, 4, workspace, 4
            	bind = $mod, 5, workspace, (
            	bind = $mod, 6, workspace, -
            	bind = $mod, 7, workspace, è
            	bind = $mod, 8, workspace, _
            	bind = $mod, 9, workspace, ç
            	bind = $mod, 0, workspace, à

            	bind = $mod SHIFT, 1, movetoworkspace, &
            	bind = $mod SHIFT, 2, movetoworkspace, é
            	bind = $mod SHIFT, 3, movetoworkspace, 3
            	bind = $mod SHIFT, 4, movetoworkspace, 4
            	bind = $mod SHIFT, 5, movetoworkspace, (
            	bind = $mod SHIFT, 6, movetoworkspace, -
            	bind = $mod SHIFT, 7, movetoworkspace, è
            	bind = $mod SHIFT, 8, movetoworkspace, _
            	bind = $mod SHIFT, 9, movetoworkspace, ç
            	bind = $mod SHIFT, 0, movetoworkspace, à
    '';
  };
}

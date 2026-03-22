{ pkgs, lib, ... }:

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

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  home.packages = with pkgs; [
    discord
    catppuccin-discord
    rofi
    hyprpanel
    hyprlauncher
    fastfetch
    kdePackages.dolphin
    waypaper
    hyprpaper
    vscode
  ];

  programs.ghostty.enable = true;
  programs.alacritty.enable = true;
  programs.chromium.enable = true;
  programs.btop.enable = true;
  programs.hyprlock.enable = true;
  programs.neovim.enable = true;

  programs.anki = {
    enable = true;
    language = "fr_FR";
    profiles."coco" = {
      sync = {
        autoSync = true;
        syncMedia = true;
        usernameFile = "/home/coco/anki/username";
        keyFile = "/home/coco/anki/key";
      };
    };
    addons = [
      pkgs.ankiAddons.passfail2
      pkgs.ankiAddons.anki-connect
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    initContent = ''
      # Ctrl + flèches (comme bash/readline)
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
    '';
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

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "";
          path = "~/dotfiles/wallpaper/wolf_forest.jpg";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    extraConfig = ''
                  monitor = DP-3, 3440x1440@164.90Hz,0x0,1

                  exec-once = hyprpaper &
      	    exec-once = openrazer 

            general {
            	col.active_border = $accent $surface1 45deg
                    col.inactive_border = $surface0
            	resize_on_border = false
            	border_size = 2

            }

            decoration {
            	rounding = 10
            	# Change transparency of focused and unfocused windows
                active_opacity = 1
                inactive_opacity = 1

                shadow {
                          enabled = true
                          range = 15
                          render_power = 3
                          # L'ombre utilise la couleur la plus sombre du thème (crust ou mantle)
                          color = $crust
                          # Tu peux aussi l'adoucir un peu avec une couleur "base"
                          # color = $base
                      }

            blur {
                          enabled = true
                          size = 4
                          passes = 2
                          new_optimizations = true
                          ignore_opacity = true
                      }

            }

            animations {
            	enabled = yes

                #        NAME,           X0,   Y0,   X1,   Y1
                bezier = easeOutQuint,   0.23, 1,    0.32, 1
                bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
                bezier = linear,         0,    0,    1,    1
                bezier = almostLinear,   0.5,  0.5,  0.75, 1
                bezier = quick,          0.15, 0,    0.1,  1

                #           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
                animation = global,        1,     10,    default
                animation = border,        1,     5.39,  easeOutQuint
                animation = windows,       1,     4.79,  easeOutQuint
                animation = windowsIn,     1,     4.1,   easeOutQuint, popin 87%
                animation = windowsOut,    1,     1.49,  linear,       popin 87%
                animation = fadeIn,        1,     1.73,  almostLinear
                animation = fadeOut,       1,     1.46,  almostLinear
                animation = fade,          1,     3.03,  quick
                animation = layers,        1,     3.81,  easeOutQuint
                animation = layersIn,      1,     4,     easeOutQuint, fade
                animation = layersOut,     1,     1.5,   linear,       fade
                animation = fadeLayersIn,  1,     1.79,  almostLinear
                animation = fadeLayersOut, 1,     1.39,  almostLinear
                animation = workspaces,    1,     1.94,  almostLinear, fade
                animation = workspacesIn,  1,     1.21,  almostLinear, fade
                animation = workspacesOut, 1,     1.94,  almostLinear, fade
                animation = zoomFactor,    1,     7,     quick

            }

            misc {
            	disable_hyprland_logo = true
            	disable_splash_rendering = true
            }

                  input {
                    kb_layout = fr
                    kb_variant =
                    kb_model =
                    kb_options =
                    kb_rules =
                    follow_mouse = 1
                    accel_profile = flat
                    sensitivity = 0.25 # -1.0 - 1.0, 0 means no modification.
                  }

                  $mod = ALT

                  # Misc
                  bind = $mod, D, exec, hyprlauncher
                  bind = $mod, RETURN, exec, ghostty
                  bind = $mod, F, fullscreen,
                  bind = $mod, A, killactive,
                  bind = $mod, E, exec, dolphin
                  bind = $mod, V, togglefloating,
                  bind = $mod, L, exec, hyprlock
                                      
                  # Windows managing
                  bind = $mod, left, movefocus, l
                  bind = $mod, right, movefocus, r
                  bind = $mod, up, movefocus, u
                  bind = $mod, down, movefocus, d

                  bind = $mod SHIFT, left, movewindow, l
                  bind = $mod SHIFT, right, movewindow, r
                  bind = $mod SHIFT, up, movewindow, u
                  bind = $mod SHIFT, down, movewindow, d

                  # Workspace managing
                  bind = $mod, ampersand, workspace, 1
                  bind = $mod, eacute, workspace, 2
                  bind = $mod, quotedbl, workspace, 3
                  bind = $mod, apostrophe, workspace, 4
                  bind = $mod, parenleft, workspace, 5
                  bind = $mod, minus, workspace, 6
                  bind = $mod, egrave, workspace, 7
                  bind = $mod, underscore, workspace, 8
                  bind = $mod, ccedilla, workspace, 9
                  bind = $mod, agrave, workspace, 10

                  bind = $mod SHIFT, ampersand, movetoworkspace, 1
                  bind = $mod SHIFT, eacute, movetoworkspace, 2
                  bind = $mod SHIFT, quotedbl, movetoworkspace, 3
                  bind = $mod SHIFT, apostrophe, movetoworkspace, 4
                  bind = $mod SHIFT, parenleft, movetoworkspace, 5
                  bind = $mod SHIFT, minus, movetoworkspace, 6
                  bind = $mod SHIFT, egrave, movetoworkspace, 7
                  bind = $mod SHIFT, underscore, movetoworkspace, 8
                  bind = $mod SHIFT, ccedilla, movetoworkspace, 9
                  bind = $mod SHIFT, agrave, movetoworkspace, 10

                  bindm = $mod, mouse:272, movewindow
                  bindm = $mod, mouse:273, resizewindow
    '';
  };
}

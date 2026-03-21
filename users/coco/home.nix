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

  home.packages = with pkgs; [
    discord
    rofi
    hyprpanel
    hyprlauncher
    fastfetch
    kdePackages.dolphin
  ];

  programs.ghostty.enable = true;
  programs.alacritty.enable = true;
  programs.chromium.enable = true;
  programs.btop.enable = true;
  programs.hyprlock.enable = true;
  programs.vscode.enable = true;

  programs.anki = {
    enable = true;
    language = "fr_FR";
    profiles."coco" = {
      sync = {
        autoSync = true;
        syncMedia = true;
        usernameFile = "/home/coco/dotfiles/anki/username";
        keyFile = "/home/coco/dotfiles/anki/key";
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

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    extraConfig = ''
      monitor = DP-3, 3440x1440@164.90Hz,0x0,1	

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

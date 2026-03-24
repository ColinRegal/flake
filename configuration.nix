# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  config,
  pkgs,
  ...
}:

{

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix = {
    optimise.automatic = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    settings = {
      accept-flake-config = true;
      use-xdg-base-directories = true;

      trusted-users = [
        "root"
        "@wheel"
      ];

      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];

      extra-substituters = [
        "https://cache.nixos.org?priority=10"
        "https://cache.garnix.io?priority=20"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "coco"; # Define your hostname.
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      font-awesome
      nerd-fonts.noto
      noto-fonts-cjk-sans
    ];

  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  services.displayManager.sddm.autoNumlock = false;

  # Hyprland setup
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  
  # Services for nocatlia
  services.upower.enable = true;
  services.tuned.enable = true;

  # I don't remember ff
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;

  # OpenRGB configuration
  services.hardware.openrgb = {
    enable = true;
    startupProfile = "keyboard_purple_white.orp";
  };

  # Install and configure chromium
  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" # uBlock Origin Lite
      "likgccmbimhjbgkjambclfkhldnlhbnn;https://clients2.google.com/service/update2/crx" # Yomitan
      "hkledmpjpaehamkiehglnbelcpdflcab;https://clients2.google.com/service/update2/crx" # asbplayer
      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # Bitwarden
      "mgngbgbhliflggkamjnpdmegbkidiapm;https://clients2.google.com/service/update2/crx" # Remove Youtube Shorts
      "clngdbkpkpeebahjckkjfobafhncgmne;https://clients2.google.com/service/update2/crx" # Stylus
      "ammjkodgmmoknidbanneddgankgfejfh;https://clients2.google.com/service/update2/crx" # 7TV
      "ajopnjidmegmdimjlfnijceegpefgped;https://clients2.google.com/service/update2/crx" # BetterTTV
      "cmeakgjggjdlcpncigglobpjbkabhmjl;https://clients2.google.com/service/update2/crx" # Steam Inventory Helper
    ];
    # Option list: https://chromeenterprise.google/policies
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = "true";
      "PasswordManagerEnabled" = "false";
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "fr"
        "en-US"
      ];
      "ExtensionDeveloperModeSettings" = 0;

    };
  };
  users.defaultUserShell = pkgs.zsh;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    git
    home-manager
    openrazer-daemon
    polychromatic
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}

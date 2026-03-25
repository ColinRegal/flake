{

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
}

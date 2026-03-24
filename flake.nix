{
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-index-database,
      catppuccin,
      ...
    }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations.coco = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [

          ./configuration.nix
          nix-index-database.nixosModules.default
          { programs.nix-index-database.comma.enable = true; }

          catppuccin.nixosModules.catppuccin
          { catppuccin.enable = true; }

          ./users/coco/default.nix
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.coco = {
              imports = [
                # index
                nix-index-database.homeModules.nix-index
                # actual user module
                ./users/coco/home.nix
                catppuccin.homeModules.catppuccin

                ./modules/home-manager
              ];
            };

          }
        ];
      };
    };
}

{
  inputs = {
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
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

            home-manager.users.coco = {
              imports = [
                # index
                nix-index-database.homeModules.nix-index
                # actual user module
                ./users/coco/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };

          }
        ];
      };
    };
}

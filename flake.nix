{
  inputs = {
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
      nix-index-database,
      ...
    }:
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations.coco = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nix-index-database.nixosModules.default
          { programs.nix-index-database.comma.enable = true; }
        ];
      };
    };
}

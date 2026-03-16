{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs =
    { self, nixpkgs }:
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      # replace 'joes-desktop' with your hostname here.
      nixosConfigurations.coco = nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
      };
    };
}

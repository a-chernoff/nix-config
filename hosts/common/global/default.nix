{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./sops.nix
    ./nix.nix
    ./nix-ld.nix
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };
}

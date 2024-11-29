{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    self.nixosModules.default
    self.nixosModules.wsl
    ./configuration.nix
  ];

  home-manager.users."alex" = {
    imports = [
      (self + /configurations/home/alex.nix)
      (self + /modules/home/all/wsl-open.nix)
    ];
  };
}

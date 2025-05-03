{ flake, ... }:

let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    {
      # For home-manager to work
      users.users."achernoff" = {
        home = "/Users/achernoff";
      };
      home-manager.users."achernoff" = { };
      home-manager.sharedModules = [
        self.homeModules.default
        self.homeModules.jj
      ];
    }
    self.nixosModules.common
  ];

  # Auto upgrade nix package and daemon
  services.nix-daemon.enable = true;
}

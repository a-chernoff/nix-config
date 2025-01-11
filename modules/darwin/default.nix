{ flake, ... }:

let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    {
      # For home-manager to work
      users.users.${config.me.username} = {
        home = "/Users/${config.me.username}";
      };
      home-manager.users.${config.me.username} = { };
      home-manager.sharedModules = [
        self.homeModules.default
      ];
    }
    self.nixosModules.common
  ];

  # Auto upgrade nix package and daemon
  services.nix-daemon.enable = true;
}

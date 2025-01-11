{
  flake,
  pkgs,
  lib,
  ...
}:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = lib.attrValues self.overlays;
  };

  nix = {
    nixPath = [ "nixpkgs=${flake.inputs.nixpkgs}" ]; # Enables `nix-shell -p`
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # Make `nix shell` use pinned nixpkgs

    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";
      extra-platforms = lib.mkIf pkgs.stdenv.isDarwin "aarch64-darwin x86_64-darwin";
      trusted-users = [
        "root"
        (if pkgs.stdenv.isDarwin then flake.config.me.username else "@wheel")
      ];
    };
  };
}

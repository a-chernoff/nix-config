{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in
{
  nix = {
    package = pkgs.nixVersions.nix_2_18;

    settings = {
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +3";
    };
  };
}

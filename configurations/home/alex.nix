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
  imports = [
    self.homeModules.default
    self.homeModules.jj
  ];
  home.username = "alex";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/alex";
  home.stateVersion = "23.05";

  programs.helix.defaultEditor = true;
}

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
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "alex";
    startMenuLaunchers = true;
  };
}

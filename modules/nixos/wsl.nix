{ flake, ... }:

let
  inherit (flake) config;
in
{
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = config.me.username;
    startMenuLaunchers = true;
  };
}

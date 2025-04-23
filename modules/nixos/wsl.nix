{ flake, pkgs, ... }:

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

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
  };
}

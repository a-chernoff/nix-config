{
  pkgs,
  config,
  lib,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.alex = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ifTheyExist [
      "docker"
      "git"
      "podman"
      "wheel"
    ];

    openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../home/alex/ssh.pub);
    hashedPasswordFile = config.sops.secrets.alex-password.path;
    packages = [
      pkgs.home-manager
    ];
  };

  sops.secrets.alex-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.alex = import ../../../../home/alex/${config.networking.hostName}.nix;
}

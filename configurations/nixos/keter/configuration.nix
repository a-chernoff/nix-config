{ config, pkgs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "keter";

  users.users."alex" = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.helix
  ];

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "22.05";
}

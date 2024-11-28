# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.hostName = "nacon";
  users.users."alex" = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };
  environment.systemPackages = with pkgs; [
    helix
  ];
  programs.zsh.enable = true;
  system.stateVersion = "22.05";
}

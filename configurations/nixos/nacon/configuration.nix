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
  programs.nix-ld.enable = true;
  system.stateVersion = "22.05";
}

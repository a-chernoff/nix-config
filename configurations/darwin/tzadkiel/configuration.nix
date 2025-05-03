{ flake, pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "tzadkiel";

  users.users."achernoff" = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.helix
  ];

  system.configurationRevision = flake.rev or flake.dirtyRev or null;
  system.stateVersion = 5;
}

{ flake, pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "tzadkiel";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.helix
  ];

  system.configurationRevision = flake.rev or flake.dirtyRev or null;
  system.stateVersion = 5;
}

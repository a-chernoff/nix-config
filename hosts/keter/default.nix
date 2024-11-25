{ nixos-wsl }:
{
  imports = [
    nixos-wsl.nixosModules.wsl
    # ./hardware-configuration.nix
    
    ../common/global
    ../common/users/alex
  ];

  wsl = {
    enable = true;
    useWindowsDriver = true;
    wslConf = {
      automount.root = "/mnt";
    };
    defaultUser = "alex";
    startMenuLaunchers = true;
  };

  networking = {
    hostName = "keter";
    useDHCP = true;
  };

  system.stateVersion = "22.05";
  nix.settings.auto-optimise-store = false;
}

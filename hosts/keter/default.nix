{
  imports = [
    ../common/global
    ../common/users/alex
  ];

  networking = {
    hostName = "keter";
    useDHCP = true;
  };

  system.stateVersion = "22.05";
  nix.settings.auto-optimise-store = false;
}

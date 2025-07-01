{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.darwinModules.default
    ./configuration.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "tzadkiel";

  security.pam.services.sudo_local.touchIdAuth = true;

  home-manager.users.achernoff = {
    home.stateVersion = "24.11";
  };

  system.defaults = {
    dock = {
      autohide = true;
    };

    finder = {
      _FXShowPosixPathInTitle = true;
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      # Automatic light and dark mode
      AppleInterfaceStyleSwitchesAutomatically = true;
      # Full keyboard control
      AppleKeyboardUIMode = 3;
    };
  };

  system.primaryUser = "achernoff";
}

{ pkgs, ... }:
{
  home.packages = [
    pkgs.wsl-open
    pkgs.wslu
    pkgs.xdg-utils.out
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.wslu}/bin/wslview";
  };
}

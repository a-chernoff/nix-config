{ config, flake, pkgs, lib, ... }:

let
  inherit (flake) inputs;
in
{
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];
  home.packages = [
    pkgs.moreutils
    pkgs.fd
    pkgs.file
    pkgs.httpie
    pkgs.wget
    pkgs.unzip
    pkgs.tre-command
  ];
  programs = {
    bat.enable = true;
    btop.enable = true;
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
        package = lib.mkIf (config.nix.package != null)
          (pkgs.nix-direnv.override { nix = config.nix.package; });
      };
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    jq.enable = true;
    less.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };
}

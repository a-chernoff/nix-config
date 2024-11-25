{
  pkgs,
  ...
}: {
  imports = [
    ./starship
    ./zsh.nix
    ./bat.nix
    ./direnv.nix
    ./gh.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    httpie
    diffsitter
    jq
    nixd
    nixfmt-rfc-style
  ];
}

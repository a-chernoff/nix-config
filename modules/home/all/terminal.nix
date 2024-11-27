{
  programs = {
    bat.enable = true;
    btop.enable = true;
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf.enable = true;
    jq.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    ripgrep.enable = true;
    starship.enable = true;
    zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}

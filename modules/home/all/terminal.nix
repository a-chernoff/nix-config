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
    less.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
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

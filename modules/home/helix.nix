{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      editor.true-color = true;
      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
        display-signature-help-docs = true;
      };
    };
  };
}
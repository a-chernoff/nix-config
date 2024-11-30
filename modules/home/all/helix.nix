{ config, lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt-rfc-style
    ];
    settings = {
      theme = "kanagawa";
      editor.line-number = "relative";
      editor.true-color = true;
      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
        display-signature-help-docs = true;
      };
    };
    languages = {
      language-server.nixd = {
        command = "nixd";
        args = [];
      };
      language = [{
        name = "nix";
        file-types = [ "nix" ];
        formatter = { command = "nixfmt"; };
        language-servers = [ "nixd" ];
      }];
    };
  };
}

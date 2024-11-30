{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
  ];
  programs.helix = {
    enable = true;
    settings = {
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

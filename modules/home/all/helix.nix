{ flake, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt-rfc-style
    ];
    settings = {
      theme = "zed_onedark";
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
        # as of nixos 24.05, <nixpkgs> should be set to the flake used to
        # build the system
        config.nixpkgs.expr = "import <nixpkgs> {}";
      };
      language = [
        {
          name = "haskell";
          roots = [
            "Setup.hs"
            "stack.yaml"
            "*.cabal"
          ];
          auto-format = true;
        }
        {
          name = "nix";
          file-types = [ "nix" ];
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
          language-servers = [ "nixd" ];
        }
      ];
    };
  };
}

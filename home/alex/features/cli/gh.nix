{
  pkgs,
  config,
  ...
}: {
  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-markdown-preview ];
    settings = {
      version = "1";
      prompt = "enabled";
    };
  };
}

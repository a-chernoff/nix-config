{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Alexander Chernoff";
        email = "alex@chernoff.xyz";
      };
      ui.diff.tool = [
        "difft"
        "--color=always"
        "$left"
        "$right"
      ];
    };
  };
}

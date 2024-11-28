{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        extraOptions = {
          addKeysToAgent = "yes";
        };
      };
    };
  };
}

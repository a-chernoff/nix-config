{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.git = {
    enabled = true;
    package = pkgs.gitAndTools.gitFull;
    aliases = {
      can = "commit --amend --no-edit";
      wl = "worktree list";
      graph = "log --decorate --oneline --graph";
    };
    userName = "Alexander Chernoff";
    userEmail = lib.mkDefault "alex@chernoff.xyz";
    extraConfig = {
      branch.sort = "committerdate";
      core.untrackedCache = true;
      core.fsmonitor = true;
      credential.helper = ;
      
      init.defaultBranch = "main";

      merge.conflictStyle = "zdiff3";
      pull.rebase = true;
      rebase.autosquash = true;
      commit.verbose = true;
      diff.algorithm = "histogram";

      column.ui = "auto";

      push.autoSetupRemote = true;
      rerere.enabled = true;
      transfer.fsckobjects = true;
      receive.fsckobjects = true;
    };
    lfs.enable = true;
    ignores = [
      ".direnv"
      "result"
      ".DS_STORE"
    ];
  };
}

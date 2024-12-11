{
  programs.gh = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "Alexander Chernoff";
    userEmail = "alex@chernoff.xyz";

    difftastic.enable = true;

    extraConfig = {
      branch.sort = "-committerdate";
      core.untrackedCache = true;
      core.fsmonitor = true;
      commit.verbose = true;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff3";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.enabled = true;
      transfer.fsckobjects = true;
      fetch.fsckobjects = true;
      receive.fsckobjects = true;
    };

    aliases = {
      wl = "worktree list";
    };

    ignores = [
      ".DS_STORE"
      ".direnv"
      "result"
    ];

    lfs.enable = true;
  };
}

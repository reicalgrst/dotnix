{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "reicalgrst";
    userEmail = "240953095+reicalgrst@users.noreply.github.com";

    aliases = {
      a = "add";
      c = "commit";
      cl = "clone";
      cm = "commit -m";
      co = "checkout";
      d = "diff";
      f = "fetch";
      pl = "pull";
      ps = "push";
      rb = "rebase";
      rbi = "rebase -i";
      st = "status";
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

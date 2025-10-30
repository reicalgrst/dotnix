{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "reicalgrst";
    userEmail = "240953095+reicalgrst@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

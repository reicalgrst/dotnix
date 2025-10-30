{ config, pkgs, ... }:

{
  home.username = "reicalgrst";
  home.homeDirectory = "/Users/reicalgrst";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # Essential Tools
    git
    gh

    # For Better Experience
    bat
    eza
    fastfetch

    # For Nix LSP
    nixfmt-rfc-style
    nil
    nixd
  ];

  imports = [
    ./config/fish.nix
    ./config/git.nix
    ./config/direnv.nix
    ./config/zed.nix
    ./config/starship.nix
  ];

  programs.home-manager.enable = true;
}

{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [

    ];

    casks = [
      "font-fira-code-nerd-font"
      "zed"
      "iterm2"
      "zoom"
      "obsidian"
      "obs"
      "steam"
    ];
  };
}

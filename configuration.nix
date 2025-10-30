{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };
  
  system.stateVersion = 6;
  system.primaryUser = "reicalgrst";
  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.fish.enable = true;
  users.users.reicalgrst = {
    name = "reicalgrst";
    home = "/Users/reicalgrst";
    shell = pkgs.fish;
  };

  imports = [
    ./config/homebrew.nix
  ];

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      tilesize = 48;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
    };

  };
}

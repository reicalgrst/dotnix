{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      # Fish shell init
      set fish_greeting ""
     
      # Homebrew環境設定
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    
    shellAliases = {
      # git alias
      g = "git";

      # bat alias
      cat = "bat";

      # eza alias
      ls = "eza --icons --git --time-style relative -al";
    };

    interactiveShellInit = ''
      # Interactive shell settings
    '';
  };
}

{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      # Fish shell init
      set fish_greeting ""

      # Homebrew設定
      eval "$(/opt/homebrew/bin/brew shellenv)"
      # direnv設定
      eval (direnv hook fish)
    '';

    shellAliases = {
      # git alias
      g = "git";

      # bat alias
      cat = "bat";

      # eza alias
      ls = "eza --icons --git --time-style relative -al";

      #clipboard alias
      clip = "pbcopy";
      paste = "pbpaste";
    };

    interactiveShellInit = ''
      # Interactive shell settings
    '';
  };
}

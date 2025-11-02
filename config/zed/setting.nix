{ config, pkgs, ... }:

{
  home.file.".config/zed/settings.json".text = builtins.toJSON {
    ui_font_family = "FiraCode Nerd Font Mono";
    buffer_font_family = "FiraCode Nerd Font Mono";
    vim_mode = true;
    ui_font_size = 16;
    buffer_font_size = 15;
    theme = "Catppuccin Mocha";
    tab_size = 2;
    hard_tabs = false;
    soft_wrap = "editor_width";

    lsp = {
      nil = {
        initialization_options = {
          formatting = {
            command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
          };
        };
      };
    };

    languages = {
      Nix = {
        language_servers = [ "nil" ];
        format_on_save = "on";
        formatter = "language_server";
      };
    };

    terminal = {
      shell = {
        program = "${pkgs.fish}/bin/fish";
      };
      font_size = 14;
    };
  };
}

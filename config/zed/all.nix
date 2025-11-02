{ config, pkgs, ... }:

{
  imports = [
    ./setting.nix
    ./snippets/rust.nix
  ];
}

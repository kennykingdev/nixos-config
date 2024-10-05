{ lib, pkgs, config, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}



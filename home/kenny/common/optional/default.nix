{ pkgs, pkgs-stable, ... }:

{
  imports = [
    ./neovim
    # ./nixvim
  ];

  home.packages = 
  ( with pkgs; [
    discord
    filelight
    obsidian
    papirus-icon-theme
    postman
    qbittorrent
    slack
    ventoy
    zoom
  ])
  ++
  ( with pkgs-stable; [
    bitwarden
  ]);

  programs = {
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./files/wezterm/wezterm.lua;
    };

    firefox = {
      enable = true;
    };

    chromium = {
      enable = true;
    };
  };
}



{ pkgs, pkgs-stable, ... }:

{
  imports = [
    ./neovim
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
    bitwarden
  ])
  ++
  ( with pkgs-stable; [
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



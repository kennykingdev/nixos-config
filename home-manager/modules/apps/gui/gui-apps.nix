{ lib, pkgs, ... }:

{
  imports = [
    ./wezterm/wezterm.nix
  ];

  home.packages = with pkgs; [
    bitwarden
    discord
    filelight
    obsidian
    papirus-icon-theme
    postman
    qbittorrent
    slack
    ventoy
    zoom
  ];

  programs = {
    firefox = {
      enable = true;
    };

    chromium = {
      enable = true;
    };

#    thunderbird = {
#      enable = true;
#    };

  };
}

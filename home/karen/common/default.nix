{ pkgs, pkgs-stable, ... }:

{
  home.packages =
  ( with pkgs; [
    discord
    obsidian
    papirus-icon-theme
    slack
    zoom
    bitwarden
    meslo-lgs-nf
  ])
  ++
  ( with pkgs-stable; [
  ]);

  programs = {
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./files/wezterm/wezterm.lua;
    };

    firefox.enable = true;
    chromium.enable = true;
    command-not-found.enable = true;

    thunderbird = {
      enable = true;
      profiles = {
        karen = {
          isDefault = true;
        };
      };
    };
  };
}



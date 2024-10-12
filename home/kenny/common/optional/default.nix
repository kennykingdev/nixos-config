{ inputs, pkgs, ... }:

{
  imports = [
    ./neovim
    # ./nixvim
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
    wezterm = {
      enable = true;
      package = inputs.wezterm.packages.${pkgs.system}.default;
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



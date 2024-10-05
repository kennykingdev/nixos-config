{ lib, pkgs, config, ... }:
{
  imports = [
    ./sh.nix
    ./git.nix
    ./tmux.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    iotop
    neofetch
    tealdeer
    tree
  ];

  programs = {
    eza.enable = true;
    eza.git = true;
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    htop.enable = true;
    fzf.enable = true;
    thefuck.enable = true;
    yazi.enable = true;
  };
}

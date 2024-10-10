{ lib, pkgs, ... }:
{
  imports = [
    ./zsh
    ./tmux
    ./git.nix
    ./eza.nix
  ];

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    l = lib.mkDefault "ls -l";
    la = lib.mkDefault "ls -la";
    cl = "clear";
    hme = "cd ~/config/nix/home/kenny; nvim edgar.nix";
    hms = "home-manager switch --flake ~/config/nix";
    nixsw = "sudo nixos-rebuild switch --flake ~/config/nix";
    grep = "rg --color";
    md = "mkdir -p";
  };

  home.packages = with pkgs; [
    iotop
    neofetch
    tealdeer
    tree
  ];

  programs = {
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    htop.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    fzf.enable = true;
    yazi.enable = true;
  };
}

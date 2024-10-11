{ lib, pkgs, ... }:
{
  imports = [
    ./zsh
    ./tmux
    ./git.nix
    ./eza.nix
  ];

  home.shellAliases = {
    # ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    # "~" = "cd ~";
    # "-" = "cd -";
    l = lib.mkDefault "ls -l";
    la = lib.mkDefault "ls -la";
    cl = "clear";
    hme = "cd ~/config/nix/home/kenny; nvim edgar.nix";
    hms = "home-manager switch --flake ~/config/nix";
    nixsw = "sudo nixos-rebuild switch --flake ~/config/nix";
    grep = "rg";
    md = "mkdir -p";
    ps = "procs";
  };

  home.packages = with pkgs; [
    iotop
    neofetch
    tree
    procs
  ];

  programs = {
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    htop.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    yazi.enable = true;
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    fzf = {
      enable = true;
      defaultOptions = [
        "--preview='bat --color=always {}'"
        # "--bind 'ctrl-/:toggle-preview"
      ];
      defaultCommand = "fd --type f --exclude .git --follow --hidden";
      changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
    };
  };
}

{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    iotop
    neofetch
    tealdeer
    tree
  ];

  programs = {
    git = {
      enable = true;
      userName = "Kenny King";
      userEmail = "16931002+kennykingdev@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    eza = {
      enable = true;
      git = true;
    };

    zoxide = {
      enable = true;
    };

    bat = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    btop = {
      enable = true;
    };

    htop = {
      enable = true;
    };

    fzf = {
      enable = true;
    };

    thefuck = {
      enable = true;
    };

    yazi = {
      enable = true;
    };
  };
}

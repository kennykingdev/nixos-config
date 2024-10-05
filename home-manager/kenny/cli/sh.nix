{ lib, pkgs, config, ... }:
let
  shellAliases = {
    v = "nvim";
    cl = "clear";
    hme = "nvim ~/config/home-manager/kenny/home.nix";
    hms = "home-manager switch --flake ~/config";
    nixsw = "sudo nixos-rebuild switch --flake ~/config";
    grep = "grep --color";
    md = "mkdir -p";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      shellAliases = shellAliases;
      history = {
        append = true;
	ignoreAllDups = true;
	save = 50000;
	size = 50000;
      };
      historySubstringSearch.enable = true;
      defaultKeymap = "viins"; # vi mode
      oh-my-zsh = {
        enable = true;
	plugins = [
	  "colored-man-pages"
	  "colorize" # syntax highlighting for file contents
	  "sudo" # press '<Esc><Esc>' to rerun the last command with sudo
	];
      };
      plugins = [
        {
	  name = "powerlevel10k";
	  src = pkgs.zsh-powerlevel10k;
	  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	}
        {
	  name = "powerlevel10k-config";
	  src = lib.cleanSource ./dotfiles;
	  file = "p10k.zsh";
	}
      ];
      initExtra = ''
        # create a directory and cd into it
        mdcd() {
	  mkdir -p "$@" && cd "$@"
	}
      '';
    };
  };
}

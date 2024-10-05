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

  tmux-menus = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-menus";
    version = "unstable-2024-10-03";
    src = pkgs.fetchFromGitHub {
      owner = "jaclu";
      repo = "tmux-menus";
      rev = "94c2be18d5317909ff107c42187e4189efb3ac09";
      sha256 = "sha256-KTzFPpCMqzC/9G8+ZPLFfZ8gnbqAmPzLniRlcKPkopA=";
    };
    rtpFilePath = "menus.tmux";
  };
in
{
  home.packages = with pkgs; [
    iotop
    neofetch
    tealdeer
    tree
  ];

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

    tmux = {
      enable = true;
      prefix = "C-a";
      aggressiveResize = true;
      baseIndex = 1;
      escapeTime = 0;
      keyMode = "vi";
      mouse = true;
      reverseSplit = true;
      plugins = with pkgs.tmuxPlugins; [
        catppuccin
	{
	  plugin = tmux-menus;
	}
      ];
    };

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

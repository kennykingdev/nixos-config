{ lib, pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      autocd = true;
      history = {
        append = true;
        ignoreAllDups = true;
        save = 50000;
        size = 50000;
      };
      historySubstringSearch.enable = true;
      defaultKeymap = "viins"; # vi mode
      antidote = {
        enable = true;
        useFriendlyNames = true;
        plugins = [
          "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
          "ohmyzsh/ohmyzsh path:plugins/sudo"
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
          src = lib.cleanSource ./files;
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

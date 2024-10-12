{ ... }:

{
  imports = [
    ./which-key.nix
    ./gitsigns.nix
    # ./treesitter.nix
    ./completions.nix
    ./lsp.nix
  ];

  programs.nixvim = {
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>fe";
        action = "<CMD>lua MiniFiles.open()<CR>";
        options.silent = true;
        options.desc = "[F]ile [E]xplorer";
      }
      {
        mode = ["n"];
        key = "<leader>bd";
        action = "<CMD>Bdelete<CR>";
        options.silent = true;
        options.desc = "[B]uffer [D]elete";
      }
    ];

    plugins = {
      # lspsaga.enable = true; look into all this does
      tmux-navigator.enable = true;

      web-devicons = {
        enable = true;
        settings = {
          color_icons = true;
          strict = true;
        };
      };

      # highlight various types of color codes with the color used
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      mini = {
        enable = true;
        modules = {
          files = {};
        };
      };

      # close buffer without closing the window
      bufdelete.enable = true;

      nvim-autopairs = {
        enable = true;
        settings = {};
      };

      indent-blankline = {
        enable = true;
        settings = {};
      };

      lazygit.enable = true;

      # gitsigns = {
      #   enable = true;
      #   settings = {
      #     signcolumn = true;
      #   };
      # };

      illuminate.enable = true;
    };
  };
}

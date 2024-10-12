{
  imports = [
    ./telescope.nix
    ./lsp.nix
    ./completion.nix
    ./treesitter.nix
    # ./conform.nix
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
        key = "<leader>x";
        action = "<CMD>Bdelete<CR>";
        options.silent = true;
        options.desc = "E[x]it buffer";
      }
    ];

    plugins = {
      # ui - looks
      web-devicons = {
        enable = true;
        settings = {
          color_icons = true;
          strict = true;
        };
      };

      # ui - util
      # highlight various types of color codes with the color used
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      # editor - layout
      # breadcrumbs for file location at top of screen
      # barbecue.enable = true;

      # editor - layout
      # close buffer without closing the window
      bufdelete.enable = true;

      # editor - util
      better-escape.enable = true;

      # editor - util
      nvim-autopairs = {
        enable = true;
        settings = {};
      };

      # ui - looks
      dressing = {
        enable = true;
        settings = {};
      };

      # code - 
      friendly-snippets.enable = true;
      
      # ui - util
      # highlight other uses of the word under the cursor
      illuminate.enable = true;

      gitsigns = {
        enable = true;
        settings = {
          signcolumn = true;
        };
      };

      indent-blankline = {
        enable = true;
        settings = {};
      };

      lazygit.enable = true;

      mini = {
        enable = true;
        modules = {
          files = {};
        };
      };

      which-key = {
        enable = true;
        settings = {
          delay = 200; # delay before showing the popup
          notify = true; # show warning when issues detected with mappings
          preset = "modern";
          show_keys = true;
        };
      };
    };
  };
}

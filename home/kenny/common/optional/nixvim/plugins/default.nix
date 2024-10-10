{
  imports = [
    ./telescope.nix
    ./lsp.nix
    ./completion.nix
    ./treesitter.nix
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
      conform-nvim = {
        enable = true;
        settings = {
          default_format_opts = {
            # fallback to LSP formatting when no others are available
            lsp_format = "fallback"; 
          };
        };
      };

      web-devicons = {
        enable = true;
        settings = {
          color_icons = true;
          strict = true;
        };
      };

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      # breadcrumbs for file location at top of screen
      # barbecue.enable = true;

      # close buffer without closing the window
      bufdelete.enable = true;

      better-escape.enable = true;

      nvim-autopairs = {
        enable = true;
        settings = {};
      };

      dressing = {
        enable = true;
        settings = {};
      };

      gitsigns = {
        enable = true;
        settings = {};
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

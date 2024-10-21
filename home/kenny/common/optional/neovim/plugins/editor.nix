{
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>bd";
        action = "<CMD>Bdelete<CR>";
        options.silent = true;
        options.desc = "[B]uffer [D]elete";
      }
    ];

    plugins = {
      # tmux + nvim integration
      tmux-navigator.enable = true;
      # highlight other instances of the word under the cursor
      illuminate.enable = true;
      # close buffer without closing the window
      bufdelete.enable = true;

      # highlight various types of color codes with the color used
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      rainbow-delimiters = {
        enable = true;
        highlight = [
          "RainbowDelimiterYellow"
          "RainbowDelimiterBlue"
          "RainbowDelimiterOrange"
          "RainbowDelimiterGreen"
          "RainbowDelimiterViolet"
          "RainbowDelimiterCyan"
          # red makes it look like an error to me
          # "RainbowDelimiterRed"
        ];
      };

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
        };
      };

      which-key = {
        enable = true;

        # Document existing key chains
        settings = {
          preset = "modern";
          spec = [
            {
              __unkeyed-1 = "<leader>f";
              group = "Find/File";
            }
            {
              __unkeyed-1 = "<leader>x";
              group = "Toggles";
            }
            {
              __unkeyed-1 = "<leader>d";
              group = "Diagnostics";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
            }
            {
              __unkeyed-1 = "<leader>b";
              proxy = "<C-b>";
              group = "Buffers";
            }
            {
              __unkeyed-1 = "<leader>w";
              proxy = "<C-w>";
              group = "Windows";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
            }
            {
              __unkeyed-1 = "<BS>";
              desc = "Decrement Selection";
              mode = "x";
            }
            {
              __unkeyed-1 = "<C-Space>";
              desc = "Increment Selection";
              mode = [ "x" "n" ];
            }
          ];
        };
      };

      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };
        keymaps = {
          "<leader>/" = {
            action = "live_grep";
            options = {
              desc = "Telescope grep search";
            };
          };
          "<leader>:" = {
            action = "command_history";
            options = {
              desc = "Telescope command history";
            };
          };
          "<leader>bf" = {
            action = "<CMD>Telescope buffer sort_mru=true sort_lastused=true<CR>";
            options = {
              desc = "[b]uffers, [f]ind";
            };
          };
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "[f]ind [f]iles (root dir)";
            };
          };
          "<leader>fk" = {
            action = "keymaps";
            options = {
              desc = "[f]ind [k]eymaps";
            };
          };
          "<leader>gf" = {
            action = "git_files";
            options = {
              desc = "[g]it [f]iles";
            };
          };
          "<leader>gc" = {
            action = "git_commits";
            options = {
              desc = "[g]it [c]ommits";
            };
          };
        };
      };

      # better vim.ui interfaces
      dressing = {
        enable = true;
        settings = {
          input.enabled = true;
          select = {
            enabled = true;
            backend = [
              "telescope"
              "builtin"
              "fzf"
            ];
          };
        };
      };
    };
  };
}


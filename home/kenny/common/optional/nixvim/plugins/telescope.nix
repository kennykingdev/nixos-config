{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "[F]ind [F]iles";
            };
          };
        "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "[F]ind/[G]rep";
            };
          };
        "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "[F]ind [B]uffer";
            };
          };
        "<leader>fh" = {
            action = "help_tags";
            options = {
              desc = "[F]ind [H]elp";
            };
          };
        "<leader>fd" = {
            action = "diagnostics";
            options = {
              desc = "[F]ind [D]iagnostics";
            };
          };
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
          "^node_modules/"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };
  };
}

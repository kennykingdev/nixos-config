{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      { # unset any other mappings of space key
        mode = ["n"];
        key = "<Space>";
        action = "<Nop>";
        options.silent = true;
      }

      { # Esc to clear search results
        mode = ["n"];
        key = "<Esc>";
        action = "<CMD>noh<CR>";
        options.silent = true;
      }

      { # fix Y behavior
        mode = ["n"];
        key = "Y";
        action = "y$";
        options.silent = true;
      }

      # move focus to pane with Ctrl+hjkl
      {
        mode = ["n"];
        key = "<C-h>";
        action = "<C-w>h";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-l>";
        action = "<C-w>l";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-j>";
        action = "<C-w>j";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-k>";
        action = "<C-w>k";
        options.silent = true;
      }

      # resize pane with Ctrl+Alt+hjkl
      {
        mode = ["n"];
        key = "<C-M-h>";
        action = "<CMD>vertical resize +2<CR>";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-M-l>";
        action = "<CMD>vertical resize -2<CR>";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-M-k>";
        action = "<CMD>resize -2<CR>";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<C-M-j>";
        action = "<CMD>resize +2<CR>";
        options.silent = true;
      }

      # amplified H/L to go to end of lines
      {
        mode = ["n"];
        key = "H";
        action = "^";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "L";
        action = "$";
        options.silent = true;
      }

      # move current line up/down with Alt-jk
      {
        mode = [ "n" ];
        key = "<M-j>";
        action = "<CMD>move+<CR>";
        options.silent = true;
      }
      {
        mode = [ "n" ];
        key = "<M-k>";
        action = "<CMD>move-2<CR>";
        options.silent = true;
      }

      # scroll up/down half page, and leave cursor in middle of the page
      {
        mode = [ "n" ];
        key = "<C-u>";
        action = "<C-u>zz";
        options.silent = true;
      }
      {
        mode = [ "n" ];
        key = "<C-d>";
        action = "<C-d>zz";
        options.silent = true;
      }

      # when "next"-ing through search results, put result/cursor mid-page
      {
        mode = [ "n" ];
        key = "n";
        action = "nzzzv";
        options.silent = true;
      }
      {
        mode = [ "n" ];
        key = "N";
        action = "Nzzzv";
        options.silent = true;
      }

      # better indenting
      {
        mode = [ "v" ];
        key = ">";
        action = ">gv";
        options.silent = true;
      }
      {
        mode = [ "v" ];
        key = "<";
        action = "<gv";
        options.silent = true;
      }
      {
        mode = [ "v" ];
        key = "<TAB>";
        action = ">gv";
        options.silent = true;
      }
      {
        mode = [ "v" ];
        key = "<S-TAB>";
        action = "<gv";
        options.silent = true;
      }

      # quick escape from insert mode
      # {
      #   mode = [ "i" ];
      #   key = "jk";
      #   action = "<ESC>";
      #   options.silent = true;
      # }

      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
    ];
  };
}

{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymappings.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    luaLoader.enable = true;

    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
    };

    extraPackages = with pkgs; [];

    globals = { # vim.g.*
      have_nerd_font = true;
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      # loaded_python_provider = 0; # Python 2
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = { # vim.opt.*
      termguicolors = true; # Enables 24bit RGB color
      cursorline = true; # Highlight line with the cursor, making it easier to find
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      tabstop = 2; # Number of spaces that a <Tab> counts for
      softtabstop = 2; # Number of spaces a <Tab> counts for in editing operations
      shiftwidth = 2; # Number of spaces to use for each step of (auto)indent
      expandtab = true; # Use the appropriate number of spaces to insert a <Tab>
      signcolumn = "yes"; # enable sign column
      autoindent = true; # auto indent on new lines
      smartindent = true; # smart autoindenting
      linebreak = true; # wrap long lines at certain characters, set with 'breakat'
      autoread = true; # when a file is changed outside vim and not changed in vim, re-read it
      scrolloff = 10; # keep min number of lines of context when scrolling up/down
      sidescrolloff = 4; # keep min number of lines of context when scrolling left/right
      colorcolumn = "81"; # highlight the start of 'out-of-bounds'
      mouse = "a"; # enable mouse (easy resizing, etc)
      updatetime = 100;  # faster completion
      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;
      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;
      # Decrease mapped sequence wait time, displays which-key popup sooner
      timeoutlen = 300;
      # Sets how neovim will display certain whitespace characters in the editor.
      # See `:help 'list'` and `:help 'listchars'`
      list = true;
      listchars = { tab = "» "; trail = "·"; nbsp = "␣"; };
      incsearch = true; # easy searching. "/const * =" would find all const assignments
      inccommand = "split"; # Preview substitutions live, as you type!
      swapfile = false; # disable the swap file
      undofile = true; # save and restore undo history
      cmdheight = 0; # remove command line
    };

    autoGroups = {
      highlight_yank = {
        clear = true;
      };
    };

    autoCmd = [
      {
        desc = "Highlight when yanking (copying) text";
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
      }
    ];
  };
}


{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      # Enable Nixvim injections, e.g. highlighting 'extraConfigLua' as lua
      nixvimInjections = true;

      # Enable tree-sitter based folding
      folding = false;

      settings = {
        auto_install = true;
        highlight.enable = true;
        indent.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<CR>";
            scope_incremental = "<CR>";
            node_incremental = "<TAB>";
            node_decremental = "<S-TAB>";
          };
        };
      };
    };
  };
}

{ programs.nixvim = {
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>fe";
        action = "<CMD>lua MiniFiles.open()<CR>";
        options.silent = true;
        options.desc = "[F]ile [E]xplorer";
      }
    ];

    plugins.mini = {
      enable = true;
      mockDevIcons = true;

      modules = {
        # replaces need for webdevicons
        icons = {};
        # file explorer
        files = {};
        # improved a/i text-objects
        ai = {
          n_lines = 500; # Number of lines within which textobject is searched
        };
      };
    };
  };
}

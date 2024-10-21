{
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>gg";
        action = "<CMD>LazyGit<CR>";
        options.silent = true;
        options.desc = "LazyGit";
      }
    ];

    plugins = {
      lazygit.enable = true;
    };
  };
}

{
  home.shellAliases = {
    lg = "lazygit";
  };

  programs = {
    git = {
      enable = true;
      userName = "Kenny King";
      userEmail = "16931002+kennykingdev@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    lazygit = {
      enable = true;
    };
  };
}

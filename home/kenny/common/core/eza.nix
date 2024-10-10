{
  home.shellAliases = {
    l = "eza";
    la = "eza -a";
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--long"
    ];
  };
}

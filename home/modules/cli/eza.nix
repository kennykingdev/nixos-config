{
  home.shellAliases = {
    l = "eza";
    la = "eza -a";
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--long"
    ];
  };
}

{ lib, pkgs, config, ... }:
let
  tmux-menus = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-menus";
    version = "unstable-2024-10-03";
    src = pkgs.fetchFromGitHub {
      owner = "jaclu";
      repo = "tmux-menus";
      rev = "94c2be18d5317909ff107c42187e4189efb3ac09";
      sha256 = "sha256-KTzFPpCMqzC/9G8+ZPLFfZ8gnbqAmPzLniRlcKPkopA=";
    };
    rtpFilePath = "menus.tmux";
  };
in
{
  programs = {
    tmux = {
      enable = true;
      prefix = "C-a";
      aggressiveResize = true;
      baseIndex = 1;
      escapeTime = 0;
      keyMode = "vi";
      mouse = true;
      reverseSplit = true;
      plugins = with pkgs.tmuxPlugins; [
        catppuccin
	{
	  plugin = tmux-menus;
	}
      ];
    };
  };
}


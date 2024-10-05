{ config, pkgs, lib, ... }:

let
  locale = lib.mkDefault "en_US.UTF-8";
in
{
  imports = [
    ./modules/openssh.nix
    ../users/kenny.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  #networking.firewall.allowedXXXPorts will be set by the module enabling a service

  # Set your time zone.
  time.timeZone = lib.mkDefault "America/Los_Angeles";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };

  # zsh
  environment.shells = with pkgs; [ bash zsh ];
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
    shellAliases = {
      vim = "nvim";
    };
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "colored-man-pages"
	"colorize" # syntax highlighting for file contents
	"sudo" # press <Esc><ESC> to run last command with sudo
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    neofetch
    wget
    curl
  ];

  # System-wide environment Variables
  environment.variables = {
    EDITOR = "nvim";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

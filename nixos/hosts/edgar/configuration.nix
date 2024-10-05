{ config, pkgs, ... }:

let
  locale = "en_US.UTF-8";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../users/kenny.nix
      ../../users/karen.nix
    ];

  # Boot Options
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "edgar";
    networkmanager.enable = true;
    firewall = {
      enable = true; # default, but I thought I'd be clear
      allowedTCPPorts = [
        22 # SSH
      ];
      allowedUDPPorts = [
      ];
    };
  };

  # System-wide environment Variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

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

  # GUI
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # zsh
  environment.shells = with pkgs; [ bash zsh ];
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "colored-man-pages"
	"colorize" # syntax highlighting for file contents
      ];
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    wget
    curl
    clinfo # used to verify OpenCL is correctly set up
    vulkan-tools # used to verify Vulkan drivers are correctly set up
  ];

  # List services that you want to enable:
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    fail2ban.enable = true;
  };

  # GPU Acceleration
  hardware.graphics = {
    # Enable accelerated OpenGL rendering through the Direct Rendering Interface
    # for 32-bit programs such as Wine
    enable32Bit = true;
    # OpenCL driver
    extraPackages = with pkgs; [
      rocmPackages_5.clr.icd  # Must use version 5 with my old RX560 (or any Polaris card)
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];

    # cached builds of wezterm-nightly
    substituters = ["https://wezterm.cachix.org"];
    trusted-public-keys = ["wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="];
  };

}

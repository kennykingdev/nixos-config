{ pkgs, ... }:

{
  imports = [
    ../core
    ../optional/services/plasma.nix
    ../optional/services/audio.nix
    ../optional/services/printing.nix
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    # cached builds of wezterm-nightly
    substituters = ["https://wezterm.cachix.org"];
    trusted-public-keys = ["wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="];
  };

  environment.systemPackages = with pkgs; [
    clinfo # used to verify OpenCL is correctly set up
    vulkan-tools # used to verify Vulkan drivers are correctly set up
  ];

  # GPU Acceleration
  hardware.graphics = {
    # Enable accelerated OpenGL rendering through the Direct Rendering Interface
    # for 32-bit programs such as Wine
    enable32Bit = true;
  };
}

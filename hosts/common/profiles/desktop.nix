{ pkgs, ... }:

{
  imports = [
    ../core.nix
    ../services/audio.nix
    ../services/plasma.nix
    ../services/printing.nix
    ../services/openssh.nix
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

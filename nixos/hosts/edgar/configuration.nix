{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../desktop.nix
    ];

  networking.hostName = "edgar";

  # Stuff I need to set for my old RX560 GPU
  boot.initrd.kernelModules = [ "amdgpu" ];
  # OpenCL driver
  # Must use version 5 with RX560 (or any Polaris card)
  hardware.graphics.extraPackages = [ pkgs.rocmPackages_5.clr.icd ];

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

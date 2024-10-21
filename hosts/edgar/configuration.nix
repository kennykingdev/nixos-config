{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/core.nix
      ../common/profiles/desktop.nix
      ../common/users
    ];

  networking.hostName = "edgar";

  # Stuff I need to set for my old RX560 GPU
  boot.initrd.kernelModules = [ "amdgpu" ];
  # OpenCL driver
  # Must use version 5 with RX560 (or any Polaris card)
  hardware.graphics.extraPackages = [ pkgs.rocmPackages_5.clr.icd ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}

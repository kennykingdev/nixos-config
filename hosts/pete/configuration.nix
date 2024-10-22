{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/core.nix
      ../common/users/kenny.nix
    ];

  networking.hostName = "pete";
}

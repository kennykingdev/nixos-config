{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common/core.nix
      ../common/users/kenny.nix
      # ../common/services/docker.nix
    ];

  networking.hostName = "services-01";
}

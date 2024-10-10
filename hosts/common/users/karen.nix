{ config, pkgs, ... }:

{
  users.users.karen = {
    isNormalUser = true;
    description = "Karen King";
    extraGroups = [ "networkmanager" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };
}

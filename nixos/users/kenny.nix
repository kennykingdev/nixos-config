{ config, pkgs, ... }:

{
  users.users.kenny = {
    isNormalUser = true;
    description = "Kenny King";
    extraGroups = [ "networkmanager" "wheel" ];
    uid = 1000;
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmYYPePwrjvsoEQFBOzzIod+1RzvokhZXMh+jtdt+md kenny-laptop"
    ];
  };
}


{ pkgs, ... }:

{
  users.users.kenny = {
    initialHashedPassword = "$y$j9T$axbCyy8FKMjJ3f0uVJOmL0$Wu0VWrOkx1iloUCaoECvYURCxP8pOhSfq99aj9SzAWC";
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


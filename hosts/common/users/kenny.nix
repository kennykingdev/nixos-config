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
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmYYPePwrjvsoEQFBOzzIod+1RzvokhZXMh+jtdt+md kenny-laptop"
    ];
  };

  ## Use later when setting up node/npm/etc
  ##
  ## environment.sessionVariables = {
  ##   # dev containers?
  ##   # PATH = [
  ##   #   "$HOME/.npm-global/bin/" # `npm install -g` will put stuff here
  ##   # ];
  ## };
  ## programs.npm = {
  ##   enable = true;
  ##   # the prefix will tell it to put global installs under $HOME
  ##   # because NixOS handles all system-wide software.
  ##   # Be sure to put the new location in your PATH variable
  ##   npmrc = ''
  ##     prefix = ''${HOME}/.npm-global
  ##     init-license=MIT
  ##     init-author-name="Kenny King"
  ##     init-version="0.0.1"
  ##     color="always"
  ##   '';
  ## };
}


{ pkgs, pkgs-stable, ... }:

{
  users.users.karen = {
    initialHashedPassword = "$y$j9T$1E.9UWo4q.vpiR7eAaSab.$sPmJl/6p.MmrStUYhf61qhqM0iNjLpW0QkKEe2jiaYA";
    isNormalUser = true;
    description = "Karen King";
    extraGroups = [ "networkmanager" ];
    packages = (with pkgs; [
        thunderbird
      ]
      ++ (with kdePackages; [
        kate
      ]))
      ++
      ( with pkgs-stable.kdePackages; [
        kblocks
        kbounce
        kbreakout
        kshisen
        kpat
        kmahjongg
      ]);
  };
}

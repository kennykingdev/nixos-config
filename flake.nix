{
  description = "My Main Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixosSystem = nixpkgs.lib.nixosSystem;
      homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;
    in
    {
      nixosConfigurations = {
        edgar = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
	    ./nixos/hosts/edgar/configuration.nix
	  ];
        };
      };

      homeConfigurations = {
        kenny = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/kenny/home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}

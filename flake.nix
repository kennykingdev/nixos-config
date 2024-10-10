{
  description = "Kenny's Main Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm.url = "github:wez/wezterm?dir=nix";
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        edgar = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/edgar/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        kenny = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/kenny/edgar.nix ];
          extraSpecialArgs = { inherit inputs; inherit nixvim; };
        };
      };
    };
}

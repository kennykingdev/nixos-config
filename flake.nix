{
  description = "Kenny's Main Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
    ...
  } @inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs outputs;};

    nixosConfigurations = {
      edgar = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/edgar/configuration.nix
        ];
        specialArgs = { inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      "kenny@edgar" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/kenny/edgar.nix ];
        extraSpecialArgs = { inherit inputs outputs nixvim pkgs-stable; };
      };
    };
  };
}

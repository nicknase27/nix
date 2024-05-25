{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";

  };

  outputs = { self, nixpkgs, nixos-hardware, ... }@inputs: {
    nixosConfigurations.dio= nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/pc/configuration.nix
        inputs.home-manager.nixosModules.default
	inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.kira= nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/x280/configuration.nix
        inputs.home-manager.nixosModules.default
	nixos-hardware.nixosModules.lenovo-thinkpad-x280
	inputs.stylix.nixosModules.stylix
      ];
    };
  };
}

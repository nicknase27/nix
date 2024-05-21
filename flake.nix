{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix.url = "github:danth/stylix";

  };

  outputs = { self, nixpkgs, nixos-hardware, nixvim,... }@inputs: {
    nixosConfigurations.dio= nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
	inputs.nixvim.nixosModules.nixvim
	inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.kira= nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/laptop/configuration.nix
        inputs.home-manager.nixosModules.default
	nixos-hardware.nixosModules.lenovo-thinkpad-x280
	inputs.stylix.nixosModules.stylix
      ];
    };
  };
}

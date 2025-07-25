{
  description = "Your first flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ ... }: let
    settings = {
      system = {
        flakePath = ".flake";
      };
      account = {
        name = "vizzion";
      };
    };
  in {
    nixosConfigurations.workstation = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; settings = settings // { profile = "workstation"; }; };

      system = "x86_64-linux";
      modules = [
        inputs.home-manager.nixosModules.home-manager
        ./profile/workstation/hardware.nix
        ./profile/workstation/configuration.nix
        ./compose.nix
      ];
    };
    nixosConfigurations.home = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; settings = settings // { profile = "home"; }; };
      system = "x86_64-linux";
      modules = [
        inputs.home-manager.nixosModules.home-manager
        ./profile/home/hardware.nix
        ./profile/home/configuration.nix
        ./compose.nix
      ];
    };
  };
}

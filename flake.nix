{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager?ref=master";
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: {
    hmConfigurations.standalone = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home
      ];
    };
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        home-manager.nixosModules.home-manager
        ./nixos/home-manager.nix
        ./systems/nixos/configuration.nix
      ];
    };
  };
}

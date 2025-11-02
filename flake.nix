{
  description = "Main flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nvf,
      home-manager,
      sops-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      nixos_system = nixpkgs.lib.nixosSystem;
      shared_modules = [
        ./hosts/shared/configuration.nix
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        sops-nix.nixosModules.sops
        {
          home-manager = {
            shared_modules = [
              sops-nix.homeManagerModules.sops
            ];
            useGlobalPkgs = true;
            useUserPackages = true;
            users.jonathan = ./users/jonathan/home.nix;
            users.windows = ./users/windows/home.nix;
            extraSpecialArgs = inputs;
          };
        }
      ];
      shared_desktop_modules = [
        ./hosts/shared_desktop/configuration.nix
      ];
    in
    {
      nixosConfigurations = {
        laptop = nixos_system {
          inherit system;
          modules = shared_modules ++ [
            ./hosts/laptop/configuration.nix
          ];
        };
        desktop-mom = nixos_system {
          inherit system;
          modules =
            shared_modules
            ++ shared_desktop_modules
            ++ [
              ./hosts/desktop-mom/configuration.nix
            ];
        };
        desktop-dad = nixos_system {
          inherit system;
          modules =
            shared_modules
            ++ shared_desktop_modules
            ++ [
              ./hosts/desktop-dad/configuration.nix
            ];
        };
      };
    };
}

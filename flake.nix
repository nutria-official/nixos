{
  description = "Nixos config flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nvf,
      home-manager,
      sops-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      nixosSystem = nixpkgs.lib.nixosSystem;
      sharedModules = [
        ./hosts/shared/configuration.nix
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        sops-nix.nixosModules.sops
        {
          home-manager = {
            sharedModules = [
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
    in

    {
      nixosConfigurations = {
        laptop = nixosSystem {
          inherit system;
          modules = sharedModules ++ [
            ./hosts/laptop/configuration.nix
          ];
        };
      };
    };
}

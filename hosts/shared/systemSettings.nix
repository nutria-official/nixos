{ config, pkgs, ... }:

{
  networking = {
    firewall = {
      checkReversePath = false;
    };
    networkmanager = {
      enable = true;
    };
  };
  nix = {
    gc = {
      options = "5d";
      automatic = true;
      dates = "daily";
    };
    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [ 
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];

      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };
  };
  time = {
    timeZone = "Europe/Copenhagen";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "dk";
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  services = {
    printing = {
      enable = true;
    };

    pipewire = {
      enable = true;
      wireplumber = {
        enable = true;
      };

      pulse = {
        enable = true;
      };
    };
    tuned = {
      enable = true;
    };
    upower = {
      enable = true;
    };
  };
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}

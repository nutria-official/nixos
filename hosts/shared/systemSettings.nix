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

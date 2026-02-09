{ config, pkgs, ... }:

{
  networking = {
    firewall = {
      checkReversePath = false;
    };
    firewall = rec {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges =  [ { from = 1714; to = 1764; } ];
    };
    networkmanager = {
      enable = true;
    };
  };
  nix = {
    gc = {
      options = "5d";
      automatic = true;
      dates = "weekly";
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

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
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
  };
}

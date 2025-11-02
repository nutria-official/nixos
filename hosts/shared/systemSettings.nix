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
      options = "--delete-older-than +5";
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

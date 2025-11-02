{
  config,
  pkgs,
  inputs,
  home-manager,
  nvf,
  sops-nix,
  ...
}:

{
  imports = [
    ../../secrets/sops.nix
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";
    stateVersion = "25.05";
    packages = with pkgs; [
      brave
      brightnessctl
      chromium
      clang
      distrobox
      dunst
      element-desktop
      extremetuxracer
      hyprpicker
      libnotify
      nemo
      neofetch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      processing
      python313Packages.pip
      python313Packages.urwid
      resources
      signal-desktop
      steam-run
      tor-browser
      unzip
      veracrypt
      vlc
      waypipe
      winboat
      yazi
      zip
      zotero
    ];
  };

  services = {
    hypridle = {
      enable = true;
      settings = import ../../modules/home-manager/environment/hypr/hypridle.nix;
    };
    hyprpaper = {
      enable = true;
      settings = import ../../modules/home-manager/environment/hypr/hyprpaper.nix;
    };
    hyprsunset = {
      enable = true;
    };
  };

  programs = {
    firefox = {
      enable = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "cat ${config.sops.secrets."name".path}";
          email = "cat ${config.sops.secrets."email".path}";
        };
      };
    };
    home-manager = {
      enable = true;
    };
    hyprlock = {
      enable = true;
      settings = import ../../modules/home-manager/environment/hypr/hyprlock.nix;
    };
    hyprshot = {
      enable = true;
      saveLocation = "$HOME/Pictures/screenshots/";
    };
    nvf = {
      enable = true;
      settings = import ../../modules/home-manager/nvf.nix;
    };
    waybar = {
      enable = true;
      settings = import ../../modules/home-manager/environment/waybar/config.nix;
      style = ../../modules/home-manager/environment/waybar/style.css;
    };

    wofi = {
      enable = true;
    };
  };
}

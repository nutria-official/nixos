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
    #./modules/nvf.nix
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
      settings = import ./modules/enviornment/hypr/hypridle.nix;
    };
    hyprpaper = {
      enable = true;
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
      settings = import ./modules/enviornment/hypr/hyprlock.nix;
    };
    hyprshot = {
      enable = true;
    };
    waybar = {
      enable = true;
      settings = import ./modules/enviornment/waybar/config.nix;
      style = ./modules/enviornment/waybar/style.css;
    };

    wofi = {
      enable = true;
    };
  };
}

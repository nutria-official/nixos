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
      dunst
      gcc
      gdb
      gparted
      hyprpicker
      libnotify
      nemo
      neofetch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      python315
      resources
      signal-desktop
      steam-run
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
    git = {
      enable = true;
      settings = {
        user = {
          name = "${builtins.readFile config.sops.secrets."name".path}";
          email = "${builtins.readFile config.sops.secrets."email".path}";
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
    librewolf = {
      enable = true;
    };
    nvf = {
      enable = true;
      settings = import ../../modules/home-manager/nvf.nix;
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      #settings = import ../../modules/home-manager/starship.nix;
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

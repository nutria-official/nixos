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
    ../../modules/home-manager/zsh/zsh.nix
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";
    stateVersion = "25.05";
    packages = with pkgs; [
      arduino-ide
      bottles
      brave
      brightnessctl
      chromium
      clang
      dunst
      gdb
      hyprpicker
      libnotify
      nemo
      neofetch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      #proton-vpn-cli
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
    kitty = {
      enable = true;
      keybindings = {
        "ctrl+shift+c" = "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";
      };
      shellIntegration.enableZshIntegration = true;
      settings = import ../../modules/home-manager/environment/kitty/kitty-config.nix;
      themeFile = "tokyo_night_moon";
    };
    librewolf = {
      enable = true;
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
    zsh = {
      enable = true;
    };
  };
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        settings = import ../../modules/home-manager/environment/hypr/hyprland.nix;
        xwayland.enable = true;
      };
    };
  };
}

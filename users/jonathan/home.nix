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
    ../../secrets/sops-home.nix
    ../../modules/home-manager/zsh/zsh.nix
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";
    stateVersion = "25.05";
    packages = with pkgs; [
      brave
      clang
      fastfetch
      gdb
      hyprpicker
      noisetorch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      proton-vpn-cli
      proton-pass-cli
      python315
      signal-desktop
      steam
      steam-run
      tigervnc
      unzip
      veracrypt
      vlc
      winboat
      yazi
      zip
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
    fuzzel = {
      enable = true;
    };
    git = {
      enable = true;
    #  settings = {
    #    user = {
    #      name = builtins.readFile config.sops.secrets."github/name".path;
    #      email = builtins.readFile config.sops.secrets."github/email".path;
    #    };
    #  };
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
    noctalia-shell = {
      enable = true;
    };
    nvf = {
      enable = true;
      settings = import ../../modules/home-manager/nvf.nix;
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

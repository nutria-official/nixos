{
  config,
  pkgs,
  inputs,
  home-manager,
  nvf,
  sops-nix,
  zen-browser,
  ...
}:

{
  imports = [
    ../../modules/home-manager/default.nix
    ../../secrets/sops-home.nix
    ../../modules/home-manager/zsh/zsh.nix
    zen-browser.homeModules.twilight
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";
    stateVersion = "25.05";
    packages = with pkgs; [
      brave
      cinny-desktop
      fastfetch
      gdb
      hyprpicker
      nitrokey-app2
      noisetorch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      proton-vpn
      signal-desktop
      steam-run
      tigervnc
      veracrypt
      vlc
      winboat
    ];
  };

  programs = {
    git = {
      enable = true;
    };
    home-manager = {
      enable = true;
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
    zen-browser = {
      enable = true;
    };
  };
}

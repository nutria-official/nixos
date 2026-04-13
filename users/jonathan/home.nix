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
    ../../modules/home-manager/default.nix
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
      #steam
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

  programs = {
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
    zsh = {
      enable = true;
    };
  };
}

{ pkgs, ... }:

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
      cinny-desktop
      hyprpicker
      moonlight-qt
      mullvad-browser
      nitrokey-app2
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      proton-vpn
      proton-authenticator
      proton-pass
      protonmail-desktop
      signal-desktop
      tor-browser
      trash-cli
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
    nvf = {
      enable = true;
      settings = import ../../modules/home-manager/nvf.nix;
    };
  };
  services = {
    proton-pass-agent = {
      enable = true;
    };
  };
}

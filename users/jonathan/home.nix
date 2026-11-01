{config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/default.nix
    ../../secrets/sops-home.nix
  ];

  home = {
    username = "jonathan";
    homeDirectory = "/home/jonathan";
    stateVersion = "25.05";
    packages = with pkgs; [
      cinny-desktop
      moonlight-qt
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
      standardnotes
      tor-browser
      trash-cli
      typst
      veracrypt
      vlc
    ];
    sessionVariables = {
      PROTON_PASS_LINUX_KEYRING="dbus";
    };
  };
  programs = {
    git = {
      enable = true;
    };
    home-manager = {
      enable = true;
    };
    nvf = {
      enable = true;
      settings = import ../../modules/home-manager/nvf.nix;
    };
  };
  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
    proton-pass-agent = {
      enable = true;
    };
  };
}

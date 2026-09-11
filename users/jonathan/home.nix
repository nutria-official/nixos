{
  pkgs,
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
      arduino-ide
      brave
      cinny-desktop
      fastfetch
      hyprpicker
      moonlight-qt
      musescore
      mullvad-browser
      nitrokey-app2
      noisetorch
      onlyoffice-desktopeditors
      opentabletdriver
      osu-lazer-bin
      prismlauncher
      proton-vpn
      signal-desktop
      steam-run
      trash-cli
      veracrypt
      vlc
      winboat
    ];
  };
  services = {
    ssh-agent = {
      enable = true;
    };
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
  };
}

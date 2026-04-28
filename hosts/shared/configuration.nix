{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    ./boot.nix
    ./systemSettings.nix
    ../../modules/nixos/noisetorch.nix
    ../../secrets/sops.nix
  ];

  users.mutableUsers = false; # So sops can generate userpasswords.

  users.users = {
    root.hashedPasswordFile = config.sops.secrets."hashedPassword/root".path;

    jonathan = {
      group = "wheel";
      hashedPasswordFile = config.sops.secrets."hashedPassword/jonathan".path;
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "libvirtd"
        "docker"
        "dialout"
        "networkmanager"
        "wireshark"
      ];
    };
    windows = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."hashedPassword/windows".path;
      extraGroups = [
        "docker"
      ];
    };
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  virtualisation = {
    docker = {
      enable = true;
    };
    spiceUSBRedirection = {
      enable = true;
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
    hyprland = {
      enable = true;
    };
    steam = {
      enable = true;
    };
    wireshark = {
      enable = true;
    };
  };

  hardware = {
    opentabletdriver = {
      enable = true;
      daemon = {
        enable = true;
      };
    };
    bluetooth = {
      enable = true;
    };
  };

  services = {
    displayManager.ly = {
      enable = true;
    };
    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };

    tuned.enable = true;
    upower.enable = true;

    keyd = {
      enable = true;
      keyboards = import ../../modules/nixos/keyd.nix;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      sops
      wget
    ];
    variables = {
      EDITOR = "nvim";
    };
  };
  fonts = {
    packages = with pkgs; [
      comic-mono
      corefonts
      nerd-fonts.symbols-only
    ];
  };

  xdg = {
    portal = {
      enable = true;
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  networking.networkmanager.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment? DO NOT CHANGE THIS VALUE.
}

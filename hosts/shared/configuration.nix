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
  ];

  users.users = {
    jonathan = {
      group = "wheel";
      isNormalUser = true;
      extraGroups = [
        "libvirtd"
        "docker"
        "dialout"
      ];
    };
    windows = {
      isNormalUser = true;
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
    bash = {
      interactiveShellInit = ''
        				alias maple='steam-run ~/school/applications/maple/bin/xmaple'
        			'';
    };
    noisetorch = {
      enable = true;
    };
    steam = {
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
  };

  services = {
    flatpak = {
      enable = true;
    };
    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };
    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-session";
          user = "greeter"; # NOT a username
        };
      };
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              leftalt = "layer(leftalt)";
              capslock = "overload(control, esc)"; # There has to be something to seperate the alt's, just like the spacebar.
              rightalt = "layer(rightalt)";
            };
            "rightalt:G" = {
              h = "left";
              j = "down";
              k = "up";
              l = "right";
              "space" = "enter";
              d = "backspace";
            };
            "leftalt:A" = {
              a = 1;
              s = 2;
              d = 3;
              f = 4;
              g = 5;
              h = 6;
              j = 7;
              k = 8;
              l = 9;
              o = 0;
              "space" = "tab";
            };
          };
        };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      gnumake
      greetd.tuigreet
      home-manager
      keepassxc
      networkmanagerapplet
      seahorse
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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  system.stateVersion = "25.05"; # Did you read the comment? DO NOT CHANGE THIS VALUE.
}

{
  pkgs,
  lib,
  ...
}:

let
  ssh_port = 2307;
in

{
  imports = [
    ./hardware-configuration.nix
  ];
  hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];

  boot.lanzaboote.autoEnrollKeys = {
    includeMicrosoftKeys = false;
    allowBrickingMyMachine = true;
  };

  users.users.server = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "uinput" # For sunshine.
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMTandOAfqY3qomHdTmHSgWz7mM2I2X/HaB28Eo7hKj jonathan@laptop"
    ];
  };

  services = {
    fail2ban = {
      enable = true;
    };
    holesail-server = {
      holesail-ssh = {
        enable = true;
        port = ssh_port;
        implementation = "js";
        # key = ""; set up with sops after first use 
        public = false;
        user = "server";
        group = "wheel";
        log = false;
      };
    };
    openssh = {
      enable = true;
      ports = [ ssh_port ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    sunshine = { # Acces port: 47989, webGUI port: 47990
      enable = true;
      autoStart = true;
      capSysAdmin = true;
    };
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/" ];
    };
  };

  hardware.uinput.enable = true; # For sunshine.

  #networking.firewall.allowedTCPPorts = [ ssh_port ]; Might not need this cause just forwarding a port.
  #networking.firewall.allowedUDPPorts = [ ];
}

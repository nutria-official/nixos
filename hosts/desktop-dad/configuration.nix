{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];
  hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];
  programs = {
    kdeconnect = {
      enable = true;
    };
  };

  users.users.server = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMTandOAfqY3qomHdTmHSgWz7mM2I2X/HaB28Eo7hKj jonathan@laptop"
    ];
  };

  services = {
  fail2ban = {
    enable = true;
  };
  openssh = {
    enable = true;
    ports = [ 2307 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
};

  networking.firewall.allowedTCPPorts = [ 2307 ];
  networking.firewall.allowedUDPPorts = [ ];
}

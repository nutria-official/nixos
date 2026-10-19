{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  virtualisation = {
    docker = {
      enable = true;
    };
    spiceUSBRedirection = {
      enable = true;
    };
  };
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ]; #KDEconnect port ranges.
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}

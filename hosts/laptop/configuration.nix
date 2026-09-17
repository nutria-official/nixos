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
  services.openssh.enable = true;
}

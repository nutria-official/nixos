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
  hardware.graphics.extraPackages = [ "intel-media-driver" ];
}

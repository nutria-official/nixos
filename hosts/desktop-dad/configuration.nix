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
  # hardware.graphics.extraPackages = with pkgs; [ intel-media-driver ];
}

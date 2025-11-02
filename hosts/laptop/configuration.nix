{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../shared/configuration.nix
    ./hardware-configuration.nix
  ];
}

{pkgs, lib, ... }:

{
  system.autoUpgrade.enable = true;
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/lanzaboote/";
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
      };
    };
    loader = {
      systemd-boot = {
        enable = lib.mkForce false; # Lanzaboote overwrites this.
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" ];
    initrd = {
      systemd = {
        enable = true;
      };
    };
    tmp.cleanOnBoot = true;
  };
}

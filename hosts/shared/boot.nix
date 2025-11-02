{ config, pkgs, ...}:

{
	system.autoUpgrade.enable = true;

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};

}


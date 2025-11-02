{
  pkgs,
  ...
}:

{
  home = {
    username = "windows";
    homeDirectory = "/home/windows";
    stateVersion = "25.05";
    packages = with pkgs; [
      winboat
    ];
  };
}

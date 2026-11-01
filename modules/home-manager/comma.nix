{ inputs, pkgs, ...}:

{
  programs.nix-index.package = inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-with-small-db;
  programs.nix-index-database.comma.enable = true;
}

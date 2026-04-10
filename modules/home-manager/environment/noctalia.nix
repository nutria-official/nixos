{...}:

# Comes from noctalia-shell flake.
# Documentation: https://docs.noctalia.dev/ 

{
  programs.noctalia-shell = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
  };
}

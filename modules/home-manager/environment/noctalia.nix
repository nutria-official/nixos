{...}:

# Comes from noctalia-shell flake.
# Documentation: https://docs.noctalia.dev/ 

{
  programs.noctalia = {
    enable = true;
    #settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
  };
}

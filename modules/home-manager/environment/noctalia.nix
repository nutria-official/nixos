{lib, ...}:

# Comes from noctalia-shell flake.
# Documentation: https://docs.noctalia.dev/ 

{
  #home.activation.update_noctalia = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  noctalia config export full > ${builtins.path ./nocalia.toml}
  #'';

  programs.noctalia = {
    enable = true;
    #settings = fromTOML (builtins.readFile ./noctalia.toml);
  };
}

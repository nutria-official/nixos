{...}:

{
  services.unbound = {
    enable = true;
    resolveLocalQueries = true;
    enableRootTrustAnchor = true;
  };
}

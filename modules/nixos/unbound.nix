{...}:

{
  services.unbound = {
    enable = true;
    resolveLocalQueries = true;
    enableRootTrustAnchor = true;
    settings.server.qname-minimisation = true;
  };
  networking.firewall.allowedTCPPorts = [ 53 ];
  networking.firewall.allowedUDPPorts = [ 53 ];
}

{config, ...}:

{  
  services.cloudflared = {
    enable = true;
    certificateFile = config.sops.secrets."cloudflare/certificate".path;
    tunnels = {
      "7a708048-cb75-4abc-b52c-786a4f1982f2" = {
        credentialsFile = config.sops.secrets."cloudflare/credentials".path;
        default = "http_status:404";
        #ingress = {
        #
        # };
      };
    };
  };

  sops.secrets = {
    "cloudflare/credentials" = {};
    "cloudflare/certificate" = {};
  };
}

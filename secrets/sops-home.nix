{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/etc/sops/age/keys.txt";
    };
    secrets = {
      "github/name" = {};
      "github/email" = {};
    };
  };
}

{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/jonathan/.config/sops/age/keys.txt";
    };
    secrets = {
      "github/name" = {};
      "github/email" = {};
    };
  };
}

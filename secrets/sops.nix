{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/etc/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = {
      name = { };
      email = { };
    };
  };
}

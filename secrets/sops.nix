{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/etc/sops/age/keys.txt";
    };
    secrets = {
      "hashedPassword/root" = {
        neededForUsers = true;
      };
      "hashedPassword/jonathan" = {
        neededForUsers = true;
      };
      "hashedPassword/windows" = {
        neededForUsers = true;
      };
    };
  };
}

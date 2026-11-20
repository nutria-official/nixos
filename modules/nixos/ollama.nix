{ pkgs, ... }:

{
  services = {
    ollama = {
      enable = true;
      loadModels = [ "qwen3.5:9b" ];
      openFirewall = true;
      package = pkgs.ollama-vulkan;
    };
    open-webui = {
      enable = true;
      port = 8080;
      environment = {
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
        WEBUI_AUTH = "True";
        OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
      };
      openFirewall = true;
    };
  };
}

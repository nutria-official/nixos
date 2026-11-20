{ pkgs, ... }:

# https://docs.openwebui.com/reference/env-configuration/

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
        WEBUI_NAME = "SlopGPT";
        ENABLE_OPENAI_API = "False";

        ENABLE_MEMORIES = "True";
        ENABLE_MEMORY_BACKGROUND_REVIEW = "True";
        MEMORIES_REVIEW_INTERVAL_TURNS = "10";
      };
      openFirewall = true;
    };
  };
}

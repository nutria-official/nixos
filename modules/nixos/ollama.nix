{ pkgs, ... }:

# https://docs.openwebui.com/reference/env-configuration/

{
  services = {
    ollama = {
      enable = true;
      loadModels = [ "qwen3.5:9b" "gemma4:12b" ];
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
        CUSTOM_NAME = "The Clankers' Den";
        ENABLE_OPENAI_API = "False";
        ENABLE_OLLAMA_API = "True";
        ENABLE_CALENDAR = "False";
        ENABLE_CHANNELS = "False";
        ENABLE_APPS = "False";
        ENABLE_NOTES = "False";
        ENABLE_COMMENTS = "False";
        ENABLE_NOTIFICATIONS = "True";
        HOST = "0.0.0.0";

        ENABLE_MEMORIES = "True";
        ENABLE_MEMORY_BACKGROUND_REVIEW = "True";
        MEMORIES_REVIEW_INTERVAL_TURNS = "10";
        ENABLE_CONTEXT_COMPACTION = "True";
        CONTEXT_COMPACTION_TOKEN_THRESHOLD = "80000";
        CONTEXT_COMPACTION_RETENTION_PERCENTAGE = "40";
        ENABLE_TOOL_SEARCH = "True";
      };
      openFirewall = true;
    };
  };
}

{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [ "qwen3.5:9b" ];
    openFirewall = true;
    package = pkgs.ollama-vulkan;
  };
}

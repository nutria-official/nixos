{
  mainBar = {
    height = 20;
    spacing = 5;
    layer = "top";
    position = "top";
    modules-center = [
      "clock"
    ];

    modules-right = [
      "pulseaudio"
      "battery"
    ];

    modules-left = [
      "custom/spider"
      "hyprland/workspaces"
    ];

    battery = {
      format = "{capacity}% {icon}";

      states = {
        warning = 40;
        critical = 20;
      };
      format-plugged = "{capacity}% 󰂄";

      format-icons = [
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂂"
        "󰁹"
      ];
      tooltip = true;
    };

    pulseaudio = {
      format = "{volume}% {icon}";
      format-muted = "";
      format-icons = [
        "\uf026"
        "\uf027"
        "\uf028"
      ];
    };

    "custom/spider" = {
      format = ''\uef10'';
      on-click = "hyprsunset -t 4000";
      tooltip = false;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
      };
      move-to-monitor = true;
    };
  };
}

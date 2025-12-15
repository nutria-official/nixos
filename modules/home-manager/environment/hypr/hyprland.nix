let
  default = {
    app_launcher = "wofi --show drun";
    browser = "brave";
    color_picker = "hyprpicker";
    file_manager = "yazi";
    idle_daemon = "hypridle";
    lock_screen = "hyprlock";
    notification_center = "dunst";
    mod = "super";
    screenshot_utility = "hyprshot";
    screen_temperature_manager = "hyprsunset";
    terminal = "kitty";
    wallpaper_manager = "hyprlock";
    widget_manager = "waybar";
  };
in
{
  "monitor" = ", preferred, auto, auto";
  general = {
    "gaps_in" = 2;
    "gaps_out" = 4;
    "border_size" = 2;
    "col.active_border" = "rgba(FFFFFFFF)";
    "col.inactive_border" = "rgba(444E59FF)";
    "resize_on_border" = true;
    "allow_tearing" = false;
    "layout" = "dwindle";
  };

  decoration = {
    "rounding" = 5;
    "rounding_power" = 2;
    "active_opacity" = 1.0;
    "inactive_opacity" = 1.0;
  };
  animations = {
    "enable" = "no";
  };
  dwindle = {
    "pseudotile" = true;
    "preserve_split" = true;
  };
  master = {
    "new_status" = "master";
  };
  misc = {
    "force_default_wallpaper" = 0;
    "disable_hyprland_logo" = true;
  };
  input = {
    "follow_mouse" = 1;
    "kb_layout" = "dk";
    "sensitivity" = 0;
    touchpad = {
      "natural_scroll" = true;
      "disable_while_typing" = false;
    };
  };
  device = {
    "name" = "epic-mouse-v1";
    "sensitivity" = -0.5;
  };
  bind = [
    "${default.mod}, Q, exec, ${default.terminal}"
    "${default.mod}, C, killactive"
    "${default.mod}, SHIFT, C, forcekillactive"
    "${default.mod}, E, exec, ${default.file_manager}"
    "${default.mod}, V, togglefloating"
    "${default.mod}, R, exec, ${default.app_launcher}"
    "${default.mod}, P, pseudo"
    "${default.mod}, SHIFT, J, togglesplit"
    "${default.mod}, F, fullscreen"
    "${default.mod}, SHIFT, L, exec, ${default.lock_screen}"
    "${default.mod}, B, exec, ${default.browser}"
    "${default.mod}, SHIFT, S, exec, ${default.screenshot_utility} -m region --clipboard-only"
    "${default.mod}, S, exec, ${default.screenshot_utility} -m region"
    "${default.mod}, SHIFT, P, exec, ${default.color_picker}"

    "${default.mod}, H, movefocus, l"
    "${default.mod}, J, movefocus, d"
    "${default.mod}, K, movefocus, u"
    "${default.mod}, L, movefocus, r"
    "${default.mod},"

    "${default.mod}, SHIFT, 1, movetoworkspace, 1"
    "${default.mod}, SHIFT, 2, movetoworkspace, 2"
    "${default.mod}, SHIFT, 3, movetoworkspace, 3"
    "${default.mod}, SHIFT, 4, movetoworkspace, 4"
    "${default.mod}, SHIFT, 5, movetoworkspace, 5"
    "${default.mod}, SHIFT, 6, movetoworkspace, 6"
    "${default.mod}, SHIFT, 7, movetoworkspace, 7"
    "${default.mod}, SHIFT, 8, movetoworkspace, 8"
    "${default.mod}, SHIFT, 9, movetoworkspace, 9"
    "${default.mod}, SHIFT, 0, movetoworkspace, 10"

    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
    "${default.mod},"
  ];
}

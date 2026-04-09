{...}:

let
 ipc = "noctalia-shell ipc call"; 
in

{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    settings = {
      "exec-once" = [
        "noctalia-shell"
      ];
      "monitor" = [ 
        "HDMI-A-3, 2560x1440@144, 0x0, 1" 
        ", preferred, 0x0, 1"
      ];
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

      xwayland = {
        "force_zero_scaling" = true;
        "use_nearest_neighbor" = true;
      };

      decoration = {
        "rounding" = 5;
        "rounding_power" = 2;
        "active_opacity" = 1.0;
        "inactive_opacity" = 1.0;
      };
      animations = {
        "enabled" = "no";
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
        "super, Q, exec, kitty"
        "super, C, killactive"
        "super SHIFT, C, forcekillactive"
        "super, E, exec, yazi"
        "super, V, togglefloating"
        "super, R, exec, ${ipc} launcher toggle"
        "super, P, pseudo"
        "super SHIFT, J, togglesplit"
        "super, F, fullscreen"
        "super SHIFT, L, exec, ${ipc} lockScreen lock"
        "super, B, exec, brave"
        "super SHIFT, S, exec, hyprshot -m region --clipboard-only"
        "super, S, exec, hyprshot -m region"
        "super SHIFT, P, exec, hyprpicker"

        "super, H, movefocus, l"
        "super, J, movefocus, d"
        "super, K, movefocus, u"
        "super, L, movefocus, r"

        "super, 1, workspace, 1"
        "super, 2, workspace, 2"
        "super, 3, workspace, 3"
        "super, 4, workspace, 4"
        "super, 5, workspace, 5"
        "super, 6, workspace, 6"
        "super, 7, workspace, 7"
        "super, 8, workspace, 8"
        "super, 9, workspace, 9"
        "super, 0, workspace, 10"

        "super SHIFT, 1, movetoworkspace, 1"
        "super SHIFT, 2, movetoworkspace, 2"
        "super SHIFT, 3, movetoworkspace, 3"
        "super SHIFT, 4, movetoworkspace, 4"
        "super SHIFT, 5, movetoworkspace, 5"
        "super SHIFT, 6, movetoworkspace, 6"
        "super SHIFT, 7, movetoworkspace, 7"
        "super SHIFT, 8, movetoworkspace, 8"
        "super SHIFT, 9, movetoworkspace, 9"
        "super SHIFT, 0, movetoworkspace, 10"

        ",XF86AudioRaiseVolume, exec, ${ipc} volume increase"
        ",XF86AudioLowerVolume, exec, ${ipc} volume decrease"
        ",XF86AudioMute, exec, ${ipc} volume muteOutput"
        ",XF86AudioMicMute, exec, ${ipc} volume muteInput"
        ",XF86MonBrightnessUp, exec, ${ipc} brightness increase"
        ",XF86MonBrightnessDown, exec, ${ipc} brightness decrease"

        #"super, "
        #"super,"
        #"super,"
        #"super,"
        #"super,"
        #"super,"
        #"super,"
        #"super,"
      ];
    };
  };
}

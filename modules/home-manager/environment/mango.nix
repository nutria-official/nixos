{...}: 

{
  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      protonvpn-app &
      noctalia &
    '';
    settings = {
      xkb_rules_layout = "dk";
      mouse_accel_profile = 0;
      mouse_natural_scrolling = 1;
      trackpad_accel_profile = 2;
      trackpad_natural_scrolling = 1;

      edge_scroller_pointer_focus = 0;


      scroller = {
        structs = 20;
        default = {
          proportion = 0.5;
          proportion_single = 1;
        };
        focus_center = 0;
        ignore_proportion_single = 0;
        prefer = {
          center = 1;
          overspread = 1;
        };
      };

      tag_rule = [
        "id:*,layout_name:scroller"
      ];

      window_rule = [
        "title:kitty,scroller_proportion:0.5"
        "title:Firefox,scroller_proportion:0.9"
      ];

      key_mode = let ipc = "noctalia msg"; in {
        default.bind = [
          "SUPER,R,spawn,${ipc} panel-toggle launcher"
          "SUPER,Escape,spawn,${ipc} session lock"
          "SUPER,t,spawn,kitty"
          "SUPER,C,killclient"
          "SUPER+SHIFT,C,killclient,force"
          "SUPER,V,togglefloating"
          "SUPER+SHIFT,F,togglefullscreen"
          "SUPER,F,togglemaximizescreen"
          "SUPER+SHIFT,R,reload_config"

          "SUPER,H,focusdir,left"
          "SUPER,L,focusdir,right"

          "SUPER+SHIFT,H,exchange_client,left"
          "SUPER+SHIFT,L,exchange_client,right"

          "SUPER,1,view,1"
          "SUPER,2,view,2"
          "SUPER,3,view,3"
          "SUPER,4,view,4"
          "SUPER,5,view,5"
          "SUPER,6,view,6"
          "SUPER,7,view,7"
          "SUPER,8,view,8"
          "SUPER,9,view,9"

          "SUPER+SHIFT,1,tag,1"
          "SUPER+SHIFT,2,tag,2"
          "SUPER+SHIFT,3,tag,3"
          "SUPER+SHIFT,4,tag,4"
          "SUPER+SHIFT,5,tag,5"
          "SUPER+SHIFT,6,tag,6"
          "SUPER+SHIFT,7,tag,7"
          "SUPER+SHIFT,8,tag,8"
          "SUPER+SHIFT,9,tag,9"

          "ALT+SHIFT,5,set_proportion,0.2"
          "ALT+SHIFT,4,set_proportion,0.25"
          "ALT+SHIFT,3,set_proportion,0.33"
          "ALT+SHIFT,2,set_proportion,0.5"
          "ALT+SHIFT,1,set_proportion,0.9"

          "SUPER,S,spawn,${ipc} screenshot-region"
          "SUPER+SHIFT,S,spawn,${ipc} screenshot-annotate"

          "ALT,Tab,togglejump"

          "ALT+SHIFT,C,centerwin"

          "NONE,XF86AudioRaiseVolume,spawn,${ipc} volume-up"
          "NONE,XF86AudioLowerVolume,spawn,${ipc} volume-down"
          "NONE,XF86AudioMute,spawn,${ipc} volume-mute"
          "NONE,XF86AudioMicMute,spawn,${ipc} mic-mute"
          "NONE,XF86MonBrightnessUp,spawn,${ipc} brightness-up"
          "NONE,XF86MonBrightnessDown,spawn,${ipc} brightness-down"
        ];
      };
    };
  };
}

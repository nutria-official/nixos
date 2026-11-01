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
          proportion = 0.9;
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

      key_mode = let ipc = "noctalia msg"; in {
        default.bind = [
          "SUPER,R,spawn,${ipc} panel-toggle launcher"
          "SUPER,Escape,spawn,${ipc} session lock"
          "SUPER,t,spawn,kitty"
          "SUPER,C,killclient"
          "SUPER+SHIFT,C,killclient,force"
          "SUPER,V,togglefloating"
          "SUPER,F,togglefullscreen"
          "SUPER+SHIFT,F,togglemaximizescreen"
          "SUPER+SHIFT,R,reload_config"

          "SUPER,S,spawn,${ipc} screenshot-region"
          "SUPER+SHIFT,S,spawn,${ipc} screenshot-annotate"

          "ALT,Tab,togglejump"
          "SUPER,Tab,setkeymode,window_manipulation"

          "NONE,XF86AudioRaiseVolume,spawn,${ipc} volume-up"
          "NONE,XF86AudioLowerVolume,spawn,${ipc} volume-down"
          "NONE,XF86AudioMute,spawn,${ipc} volume-mute"
          "NONE,XF86AudioMicMute,spawn,${ipc} mic-mute"
          "NONE,XF86MonBrightnessUp,spawn,${ipc} brightness-up"
          "NONE,XF86MonBrightnessDown,spawn,${ipc} brightness-down"
        ];
        window_manipulation.bind = [
          "NONE,Escape,setkeymode,default"
          "NONE,C,centerwin"
          "SHIFT,H,exchange_client,left"
          "SHIFT,L,exchange_client,right"

          "NONE,5,set_proportion,0.2"
          "NONE,4,set_proportion,0.25"
          "NONE,3,set_proportion,0.33"
          "NONE,2,set_proportion,0.5"
          "NONE,1,set_proportion,0.9"

          "NONE,H,focusdir,left"
          "NONE,L,focusdir,right"
        ];
      };
    };
  };
}

{
  general = {
    lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
    before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
    after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
  };

  listener = [
    {
      description = "Sets screen to minimum light intensity after 2 minutes.";
      timeout = 120;
      on-timeout = "brightnessctl -s set 10";
      on-resume = "brightnessctl -r";
    }
    {
      description = "Turns of keyboard light after 2 minutes.";
      timeout = 120;
      on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
      on-resume = "brightnessctl -rd rgb:kbd_backlight";
    }
    {
      description = "Locks screen after 3 minutes of inactivity.";
      timeout = 180;
      on-timeout = "loginctl lock-session";
    }
    {
      description = "Turns off the screen after 5 minutes.";
      timeout = 300;
      on-timeout = "hyprctl dispatch dpms off";
      on-resume = "hyprctl dispatch dpms on";
    }
    {
      description = "Suspends PC after 30 minutes.";
      timeout = 1800;
      on-timeout = "systemctl suspend";
    }
  ];
}

let
  font = "Comic Mono";
in
{
  general = {
    hide_cursor = true;
  };
  background = {
    color = "#222436";
  };
  input-field = {
    size = "20%, 5%";
    outline_thickness = 3;
    inner_color = "rgba(0, 0, 0, 0.0)";

    outer_color = "rgba(143, 143, 143, 1)";
    check_color = "rgba(00ff99ee) rgba (ff6633ee) 120 deg";
    fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

    font_color = "rgba(C0CAf5EE)";
    fade_on_emty = false;
    rounding = 15;

    font_family = font;
    placeholder_txt = "password...";

    dots_spacing = 0.3;

    position = "0, -20";
    halign = "center";
    valign = "center";
  };
  label = [
    {
      description = "Clock widget.";
      text = "$TIME";
      font_size = 90;
      font_family = font;

      position = "0, -100";
      halign = "center";
      valign = "top";
    }
    {
      description = "Date widget.";
      text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
      font_size = 25;
      font_family = font;

      position = "0, -250";
      halign = "center";
      valign = "top";
    }
    {
      description = "Keyboard layout.";
      text = "$LAYOUT[dk]";
      font_size = 24;

      position = "250, -20";
      halign = "center";
      valign = "center";
    }
    {
      description = "User widget.";
      text = "$USER";
      font_size = 25;
      font_family = font;
      position = "0, 50";
      halign = "center";
      valign = "center";
    }
    {
      description = "Fail reason.";
      text = "$FAIL";
      font_size = 12;
      font_family = font;
      position = "0, -70";
      halign = "center";
      valign = "center";
    }
  ];
}

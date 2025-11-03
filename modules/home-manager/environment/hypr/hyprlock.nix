let
  font = "Comic Mono";
in
{
  general = {
    hide_cursor = true;
  };
  background = {
    color = "rgba(222436FF)";
  };
  input-field = {
    size = "20%, 5%";
    outline_thickness = 3;
    inner_color = "rgba(222436FF)";

    outer_color = "rgba(FF966CFF)";
    fail_color = "rgba(222436FF)";
    check_color = "rgba(222436FF)";

    font_color = "rgba(C0CAf5FF)";
    fade_on_empty = false;
    rounding = 15;

    font_family = font;

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

{
  default = {
    ids = [ "*" ];
    settings = {
      main = {
        leftalt = "layer(leftalt)";
        capslock = "overload(control, esc)"; # There has to be something to seperate the alt's, just like the spacebar.
        rightalt = "layer(rightalt)";
      };
      "rightalt:G" = {
        h = "left";
        j = "down";
        k = "up";
        l = "right";
        "space" = "enter";
        d = "backspace";
      };
      "leftalt:A" = {
        a = 1;
        s = 2;
        d = 3;
        f = 4;
        g = 5;
        h = 6;
        j = 7;
        k = 8;
        l = 9;
        o = 0;
        "space" = "tab";
      };
    };
  };
}

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
      };
    };
  };
}

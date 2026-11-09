{configPath, pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    plugins = with pkgs.yaziPlugins; {
      bookmarks = {
        package = bookmarks;
        setup = true;
        settings = {
          last_directory.enable = false;
          persist = "vim";
          desc_format = "full";
          file_pick_mode = "hover";
          notify.enable = false;
          custom_desc_input = true;
          show_keys = true;
        };
      };
      chmod = chmod;
      compress = compress;
    };
    keymap = {
      mgr.prepend_keymap = [
        # bookmarks
        {run = "plugin bookmarks save";       on = ["b" "s"];}
        {run = "plugin bookmarks jump";       on = ["g" "b"];}
        {run = "plugin bookmarks delete";     on = ["b" "d"];}
        {run = "plugin bookmarks delete_all"; on = ["b" "D"];}
        # chmod
        {run = "plugin chmod"; on = ["c" "m"];}
        # other
        {run = "cd ${configPath}"; on = ["g" "n"];}
      ];
    };
  };
}

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
        {run = "plugin bookmarks save";       on = ["b" "s"]; desc = "Bookmark: save";}
        {run = "plugin bookmarks jump";       on = ["g" "b"]; desc = "Bookmark: jump";}
        {run = "plugin bookmarks delete";     on = ["b" "d"]; desc = "Bookmark: delete";}
        {run = "plugin bookmarks delete_all"; on = ["b" "D"]; desc = "Bookmark: delete all";}
        # chmod
        {run = "plugin chmod"; on = ["c" "m"]; desc = "chmod";}
        # compress
        {run = "plugin compress -l"; on = ["c" "a" "l"]; desc = "Compress: level";}
        {run = "plugin compress -phl"; on = ["c" "a" "e"]; desc = "Compress: encrypt";}
        # other
        {run = "cd ${configPath}"; on = ["g" "n"]; desc = "Go: nixos dir";}
      ];
    };
  };
}

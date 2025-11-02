{
  vim = {
    autocomplete = {
      blink-cmp = {
        enable = true;
      };
    };
    autopairs = {
      nvim-autopairs = {
        enable = true;
      };
    };
    globals = {
      mapleader = " ";
    };
    lineNumberMode = "relNumber";
    languages = {
      enableTreesitter = true;
      clang = {
        cHeader = true;
        dap = {
          enable = true;
        };
        enable = true;
        lsp = {
          enable = true;
        };
      };
      nix = {
        enable = true;
        format = {
          enable = true;
          type = "nixfmt";
        };
        lsp = {
          enable = true;
          server = "nixd";
        };
      };
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints = {
        enable = true;
      };
    };
    options = {
      tabstop = 2;
      shiftwidth = 0;
      signcolumn = "yes";
      wrap = false;
    };

    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
    };
    utility = {
      yazi-nvim = {
        enable = true;
        mappings = {
          openYazi = "<leader>y";
          openYaziDir = "<leader>Y";
        };
        setupOpts = {
          open_for_directories = true;
        };
      };
    };
  };
}

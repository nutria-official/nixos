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
    keymaps = [
      {
        key = "<leader>noh";
        mode = "n";
        silent = true;
        action = ":noh<CR>";
      }
    ];
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
      lua = {
        enable = true;
        lsp = {
          enable = true;
        };
      };
      markdown = {
        enable = true;
        extensions = {
          markview-nvim = {
            enable = true;
          };
        };
        lsp = {
          enable = true;
        };
      };
      nix = {
        enable = true;
        format = {
          enable = true;
          type = ["nixfmt"];
        };
        lsp = {
          enable = true;
          servers = ["nixd"];
        };
      };
      python = {
        format = {
          enable = true;
        };
        lsp = {
          enable = true;
        };
      };
    };
    lsp = {
      enable = true;
      formatOnSave = false;
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

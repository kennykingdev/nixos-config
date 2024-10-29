{
  programs.nixvim = {
    plugins = {
      # status line
      lualine  = {
        enable = true;
        settings = {
          options = {};
          sections = {};
        };
      };

      # adds indentation guides using virtual text
      indent-blankline.enable = true;

      # fancy notifications
      notify = {
        enable = true;
        topDown = false; # true puts notifications at the top
      };

      noice = {
        enable = true;
        settings = {
          presets = {
            bottom_search = true;
            inc_rename = true;
            lsp_doc_border = true;
          };
        };
      };

      inc-rename.enable = true;
    };
  };
}

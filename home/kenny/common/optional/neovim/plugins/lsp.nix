{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          # Mappings for `vim.lsp.buf.<action>` functions to be added when an LSP is attached
          lspBuf = { 
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            "<F2>" = "rename";
          };
          # Extra keymaps to register when an LSP is attached. This can be used 
          # to customise LSP behaviour, for example with “telescope” or the “Lspsaga” plugin, as seen in the examples
          extra = [
            # {
            #   action = "<CMD>LspStop<Enter>";
            #   key = "<leader>lx";
            # }
            # {
            #   action = "<CMD>LspStart<Enter>";
            #   key = "<leader>ls";
            # }
            # {
            #   action = "<CMD>LspRestart<Enter>";
            #   key = "<leader>lr";
            # }
            # {
            #   action = {
            #     __raw = "require('telescope.builtin').lsp_definitions()";
            #   };
            #   key = "gd";
            # }
            # {
            #   action = "<CMD>Lspsaga hover_doc<Enter>";
            #   key = "K";
            # }
          ];
        };
        servers = {
          ansiblels.enable = true;
          bashls.enable = true;
          clangd.enable = true;
          cssls.enable = true;
          # cssmodules_ls.enable = true;
          denols.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          jqls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
          # prismals.enable = true;
          pyright.enable = true;
          sqls.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;
          yamlls.enable = true;
        };
      };
    };
  };
}


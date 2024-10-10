{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>ld" = {
              action = "open_float";
              desc = "[L]ine [D]iagnostic";
            };
            # Navigate diagnostics
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
              };
            "]d" = {
              action = "goto_prev";
              desc = "Prev Diagnostic";
              };
          };

          lspBuf = {
            gd = {
              action = "definition";
              desc = "[g]oto [d]efinition";
            };
            gD = {
              action = "declaration";
              desc = "[g]oto [D]eclaration";
            };
            gr = {
              action = "references";
              desc = "[g]oto [r]eferences";
            };
            gI = {
              action = "implementation";
              desc = "[g]oto [I]mplementation";
            };
            gT = {
              action = "type_definition";
              desc = "[g]oto [T]ype Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<F2>" = {
              action = "rename";
              desc = "Rename";
            };
          };
        };

        servers = {
          lua_ls.enable = true;
          ansiblels.enable = true;
          nil_ls.enable = true;
          nixd.enable = true;
        };
      };
    };
  };
}


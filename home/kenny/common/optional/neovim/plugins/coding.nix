{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    diagnostics = {
      underline = true;
      update_in_insert = false;
      virtual_text = {
        spacing = 4;
        source = true; # or string "if_many" to only show sources if more than 1
      };
    };

    opts.completeopt = ["menu" "menuone" "noselect"];

    keymaps = [
      {
        mode = ["n"];
        key = "<leader>dd";
        action = "<CMD>Trouble diagnostics toggle<CR>";
        options.silent = true;
        options.desc = "[d]iagnostics";
      }
      {
        mode = ["n"];
        key = "<leader>db";
        action = "<CMD>Trouble diagnostics toggle filter.buf=0<CR>";
        options.silent = true;
        options.desc = "[b]uffer diagnostics";
      }
      {
        mode = ["n"];
        key = "<leader>dq";
        action = "<CMD>Trouble qflist toggle<CR>";
        options.silent = true;
        options.desc = "[q]uickfix list";
      }
      {
        mode = ["n"];
        key = "<leader>bf";
        action = "<CMD>lua require(\"conform\").format()<CR>";
        options.silent = true;
        options.desc = "[b]uffer [f]ormat";
      }
    ];

    plugins = {
      trouble.enable = true;
      ts-autotag.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;
      nvim-autopairs.enable = true;

      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
            # Some languages depend on vim's regex highlighting system 
            # (such as Ruby) for indent rules.
            additional_vim_regex_highlighting = true;
          };
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<TAB>";
              node_incremental = "<TAB>";
              scope_incremental = false;
              node_decremental = "<S-TAB>";
            };
          };
          indent = {
            enable = true;
            disable = [
              "ruby"
            ];
          };
        };
      };

      lsp = {
        enable = true;
        inlayHints = true;
        keymaps = {
          silent = true;
          # Mappings for `vim.lsp.buf.<action>` functions when an LSP is attached
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
            "<F2>" = "rename";
          };
          # Mappings for vim.diagnostic.<action> functions when an LSP is attached.
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };
          # Extra keymaps to register when an LSP is attached. This can be used
          # to customise LSP behaviour, for example with “telescope” or the 
          # “Lspsaga” plugin, as seen in the examples
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
          ansiblels.enable = true; # Ansible
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          cssls.enable = true; # CSS
          # cssmodules_ls.enable = true; # CSS modules
          # css_variables.enable = true; # CSS variables
          denols.enable = true; # Deno
          docker_compose_language_service.enable = true; # Docker compose
          dockerls.enable = true; # Docker
          lua_ls.enable = true; # Lua
          nixd.enable = true; # Nix
          tailwindcss.enable = true;
          ts_ls.enable = true;
          yamlls.enable = true;
        };
      };

      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand =
            # lua
            ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            # initiate a completion
            "<C-Space>" = "cmp.mapping.complete()";
            # abort instead of close undoes any changes
            "<C-e>" = "cmp.mapping.abort()";
            # run through selections
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            # Enter to choose a completion, but don't auto select any entry.
            # If no entry is selected, Enter should work as if there were no cmp.
            "<CR>" = "cmp.mapping.confirm({ select = false })";
          };
          sources = [
            {name = "nvim_lsp";}
            {name = "nvim_lua";}
            {name = "path";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
            # { name = "nvim_lsp_signature_help"; }
          ];
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          default_format_opts = {
            timeout_ms = 3000;
            async = false;
            quiet = false;
            # LSP formatting is used when no other formatters are available
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            sh = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            lua = ["stylua"];
            python = ["isort" "black"];
            html = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            css = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            typescript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
            markdown = [ "deno_fmt" ];
            nix = ["alejandra"];
            json = ["jq"];
            toml = [ "taplo" ];
            yaml = [ "yamlfmt" ];
            "_" = [
              "trim_whitespace"
              "trim_newlines"
            ];
          };
          formatters = {
            stylua = {command = "${lib.getExe pkgs.stylua}";};
            isort = {command = "${lib.getExe pkgs.isort}";};
            black = {command = "${lib.getExe pkgs.black}";};
            prettierd = {command = "${lib.getExe pkgs.prettierd}";};
            alejandra = {command = "${lib.getExe pkgs.alejandra}";};
            jq = {command = "${lib.getExe pkgs.jq}";};
            deno_fmt = {command = "${lib.getExe pkgs.deno}";};
            shellcheck = {command = "${lib.getExe pkgs.shellcheck}";};
            shellharden = {command = "${lib.getExe pkgs.shellharden}";};
            shfmt = {command = "${lib.getExe pkgs.shfmt}";};
            taplo = {command = "${lib.getExe pkgs.taplo}";};
            yamlfmt = {command = "${lib.getExe pkgs.yamlfmt}";};
          };
        };
      };

      lint = {
        enable = true;
      };

      navic = {
        enable = true;
        settings = {
          highlight = true;
          lsp = {
            auto_attach = true;
          };
        };
      };
    };
  };
}

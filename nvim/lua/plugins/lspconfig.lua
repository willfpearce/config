local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        update_in_insert = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
      })

      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          [[--query-driver=C:/Program Files/LLVM/bin/clangd*,C:/ProgramData/chocolatey/bin/gcc*,C:/Program Files/Microchip/xc8/v2.36/bin/xc8-cc.exe,C:/Program Files (x86)/Atmel/Studio/7.0/toolchain/avr8/avr8-gnu-toolchain/bin/avr-gcc.exe]],
          "--all-scopes-completion",
          "--completion-style=detailed",
          "--fallback-style=LLVM",
          "--offset-encoding=utf-16",
        },
        settings = {
          clangd = {
            fileStatus = true,
            fallbackStyle = "{ BasedOnStyle: LLVM, IndentWidth: 4 }",
          },
        },
      })

      -- Rust LSP
      lspconfig.rust_analyzer.setup({})

      -- R LSP
      lspconfig.r_language_server.setup({})

      -- C# LSP
      local pid = vim.fn.getpid()
      lspconfig.omnisharp.setup({
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
        on_attach = vim.lsp.buf.on_attach,
        on_init = vim.lsp.buf.on_init,
        capabilities = vim.lsp.buf.capabilities,
      })

      -- VHDL LSP
      lspconfig["vhdl_ls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- SystemVerilog LSP
      lspconfig.svls.setup({
        cmd = { "svls" },
        filetypes = { "systemverilog", "verilog" },
        root_dir = require("lspconfig.util").root_pattern("svls.toml", ".git", "."),
      })

      -- Python LSP
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })
    end,
  },
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}

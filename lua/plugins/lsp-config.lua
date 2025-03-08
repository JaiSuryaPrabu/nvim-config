return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",     -- Lua
          "pyright",    -- Python
          "clangd",     -- C/C++
          "ts_ls",   -- JavaScript/TypeScript
          "jsonls",     -- JSON
          "marksman",   -- Markdown
          "ruff",       -- Python linting (optional)
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua LSP configuration
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Python LSP (pyright)
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- C/C++ LSP (clangd)
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- JavaScript/TypeScript LSP (tsserver)
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- JSON LSP
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      -- Markdown LSP (marksman)
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })

      -- Optional: You can also configure Ruff (if you prefer its linting support)
      lspconfig.ruff.setup({
          capabilities = capabilities,
      })

      -- Global LSP keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
  },
}

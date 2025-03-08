return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,    -- Lua formatting
        null_ls.builtins.formatting.prettier,    -- JS, JSON, etc.
        null_ls.builtins.formatting.isort,       -- Python import sorting
        null_ls.builtins.formatting.black,       -- Python formatting
        -- You can add more tools as needed (e.g., markdownlint)
      },
    })
    vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, { desc = "Format Code" })
  end,
}

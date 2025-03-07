return {
  -- Treesitter for syntax highlighting
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup(
      {
        ensure_installed = {"c","lua","vim","html","css","javascript","python"},
        highlight = { enable = true },
        indent = { enable = true },
      }
    )
  end
}

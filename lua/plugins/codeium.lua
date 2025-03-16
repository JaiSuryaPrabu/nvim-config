return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",  -- Load Codeium when a buffer is opened
    config = function()
      -- Optional: Change default keybindings
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-;>', function() return vim.fn end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

      -- Optional: Disable default keybindings
      vim.g.codeium_disable_bindings = 1
    end
  }
}

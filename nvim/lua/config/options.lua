-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opts = vim.opt

opts.foldmethod = "manual"
opts.termbidi = true

vim.api.nvim_create_user_command("ArabicToggle", function()
  local enabled = not vim.wo.arabic

  vim.o.termbidi = true
  vim.wo.arabic = enabled
  vim.wo.rightleft = false

  vim.notify(("Arabic mode %s"):format(enabled and "enabled" or "disabled"))
end, { desc = "Toggle Arabic input mode" })

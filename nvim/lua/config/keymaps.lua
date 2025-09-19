-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Escape Insert Mode" })
map("i", "kj", "<Esc>", { desc = "Escape Insert Mode" })

map({ "n", "v" }, ";", ":", { desc = "Command Mode Shortcut" })

map("n", "<leader>rc", [[:%s#//.*##<CR>]], { desc = "Remove Double Slash Comments" })
map("n", "<leader>rl", [[:4,$s/\<long long\>/int/g<CR>]], { desc = "Replace 'long long' with 'int'" })
map("n", "<leader>rs", [[:%s/std:://g<CR>]], { desc = "Remove Occurences of 'std::'" })
map(
  "n",
  "<leader>ra",
  ":%s#//.*##e | 4,$s/\\<long long\\>/int/ge | %s/std:://ge | w<CR>",
  { desc = "Apply All Refactors and Save" }
)
map("n", "<leader>r", "", { desc = "frequent" })

map("n", "<S-u>", "<C-r>", { desc = "Undo but with shift U" })

map("n", "<leader>ri", function()
  vim.cmd([[g/^#include/d]])

  local lines = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "#define int long long",
  }
  vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end, { desc = "Replace #includes with standard header block" })

vim.keymap.set("n", "<leader>rlc", function()
  local start_line = nil
  local end_line = nil
  local lines_to_delete = {}

  for i = 1, vim.fn.line("$") do
    local line = vim.fn.getline(i)

    if not start_line and line:match("^%s*/%*%*") then
      start_line = i
    end

    if start_line and line:match("%*/%s*$") then
      end_line = i
      table.insert(lines_to_delete, { start_line, end_line })
      start_line = nil
      end_line = nil
    end
  end

  for i = #lines_to_delete, 1, -1 do
    local range = lines_to_delete[i]
    vim.api.nvim_buf_set_lines(0, range[1] - 1, range[2], false, {})
  end
end, { desc = "Remove /** */ Doc Comments" })

vim.keymap.set("n", "<leader>rpc", function()
  local total_lines = vim.fn.line("$")

  for i = 1, total_lines do
    local line = vim.fn.getline(i)
    if line:match("^%s*#") then
      vim.fn.setline(i, "")
    elseif line:match("#") then
      local uncommented = line:gsub("#.*", "")
      vim.fn.setline(i, uncommented)
    end
  end
end, { desc = "Remove Python Comments" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.ai_cmp = false
vim.opt.cursorline = false

vim.o.laststatus = 3 -- global statusline
vim.o.statusline = " %{mode()} %f %y %m %r %= %l:%c %p%% "
vim.o.colorcolumn = "80" -- set colorcolumn at 80 characters

-- Disable diagnostic signs in the sign column
vim.diagnostic.config({
  signs = false,
})

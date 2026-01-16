-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.ai_cmp = false

-- disables hidingtext in  md files
vim.opt.conceallevel = 0

-- only show the cmd when needed
vim.opt.cmdheight = 0

-- global statusline
function _G.navic_status()
  local ok, navic = pcall(require, "nvim-navic")
  if not ok or not navic.is_available() then
    return ""
  end
  local loc = navic.get_location()
  if loc == "" then
    return ""
  end
  return " " .. loc
end
vim.o.laststatus = 3
vim.o.statusline = " %{mode()} %f %y %m %r" .. "%{%v:lua.navic_status()%}" .. "%= %l:%c %p%% "

-- Disable diagnostic signs in the sign column
-- vim.diagnostic.config({
--   signs = false,
-- })
--

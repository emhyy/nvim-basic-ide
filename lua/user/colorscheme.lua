local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.opt.colorcolumn = "100"
vim.cmd([[highlight ColorColumn guibg=lightgrey]])

require('nightfox').setup({
  palettes = {
    -- Custom nordfox with better selection colors.
    nightfox = {
      -- sel0 = "#134675", -- visual selection
      -- sel0 = "#0f606f",
      sel1 = "#9c7502", -- search highlight
    },
  },
})

local colorscheme = "nightfox"

local status_ok, nightfox = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


vim.opt.colorcolumn = "100"
vim.cmd([[highlight ColorColumn ctermbg=238]])

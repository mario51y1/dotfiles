-- require 'colorizer'.setup()
-- require("lualine").setup()
-- require'nvim-web-devicons'.setup {
--     default = false;
-- }

-- require("nvim-autopairs").setup {}

-- require('Comment').setup()

-- require("trouble").setup()
-- require('gitsigns').setup()
-- require("copilot").setup({
--   suggestion = { enabled = false },
--   panel = { enabled = false },
-- })
-- require('render-markdown').setup({
--   enabled=true,
--   file_types = { 'markdown', 'codecompanion' },
-- })

return {
  { 'norcalli/nvim-colorizer.lua', opts = {} },
  { 'nvim-lualine/lualine.nvim', opts = {} },
  { 'nvim-tree/nvim-web-devicons', opts = {
    default = false;
  } },
  { 'windwp/nvim-autopairs', opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/trouble.nvim', opts = {} },
  { 'lewis6991/gitsigns.nvim', opts = {} },
  { 'zbirenbaum/copilot.lua', opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  } },
  { 'MeanderingProgrammer/render-markdown.nvim', opts = {
    enabled=true,
    file_types = { 'markdown', 'codecompanion' },
  } },
}

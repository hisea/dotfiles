-- return {
--   "roflolilolmao/oceanic-next.nvim",
--   priority = 1000 ,
--   config = function()
--     vim.cmd.colorscheme "OceanicNext"
--   end
-- }
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "catppuccin-mocha"
--   end
-- }
--
return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "kanagawa"
  end
}

-- return {
--   'EdenEast/nightfox.nvim',
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "nightfox"
--   end
-- }

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "tokyonight-night"
--   end
-- }
-- return {
--   "rmehri01/onenord.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "onenord"
--   end
-- }
-- return {
--   'projekt0n/github-nvim-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup()
--     vim.cmd('colorscheme github_dark_tritanopia')
--   end,
-- }

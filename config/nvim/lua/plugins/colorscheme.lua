-- return {
--   "roflolilolmao/oceanic-next.nvim",
--   priority = 1000 ,
--   config = function()
--     vim.cmd.colorscheme "OceanicNext"
--   end
-- }
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}

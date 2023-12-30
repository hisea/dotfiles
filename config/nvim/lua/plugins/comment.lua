return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },
  },
  lazy = false,
  config = function()
    require('Comment').setup()
  end
}

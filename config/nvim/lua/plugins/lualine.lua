require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'OceanicNext',
    component_separators = '',
    section_separators = { left = '', right = ''},
    -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      }
    },
  }
})
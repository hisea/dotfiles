return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    opt = true
  },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        -- theme = 'OceanicNext',
        component_separators = '',
        section_separators = { left = '', right = ''},
        -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
      },
      sections = {
        lualine_b = {
          {'branch', icon = ''},
          'diff',
          'diagnostics'
        },
      }
    })
  end
}

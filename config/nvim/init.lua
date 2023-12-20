local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "williamboman/mason.nvim",
  'neovim/nvim-lspconfig',
  "williamboman/mason-lspconfig.nvim",
  "mhartington/oceanic-next",
  "folke/which-key.nvim",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
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
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  },
  {'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "folke/neodev.nvim",
  'simrat39/rust-tools.nvim'
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'OceanicNext',
    component_separators = '',
    section_separators = { left = '', right = ''},
  }
})

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}

require('Comment').setup()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "rust", "lua", "vim", "vimdoc" },
}

require("rust-tools").setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Colorscheme
vim.cmd 'colorscheme OceanicNext'

-- Basic Settings
vim.opt.spelllang=en,cjk
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.syntax = "on"
vim.opt.encoding = "utf-8"
vim.opt.showtabline = 2
vim.opt.linespace = 2
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.fcs = "eob: "
vim.opt.filetype = "on"
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.smarttab = true
vim.opt.visualbell = true
vim.opt.smartindent = true
vim.opt.shell = "zsh"

-- Whitespace
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.backspace = "indent,eol,start"

vim.opt.listchars = {
  tab = "  ",
  trail = ".",
  extends = ">",
  precedes = "<",
}

vim.cmd [[
  "" Searching
  set incsearch   " incremental searching
  set ignorecase  " searches are case insensitive...
  set smartcase   " ... unless they contain at least one capital letter

  hi htmlArg gui=italic cterm=italic
  hi Comment gui=italic cterm=italic
  hi Type    gui=italic cterm=italic
  "hi Keyword gui=italic cterm=italic
  hi CustomItalic gui=italic cterm=italic
  call matchadd('CustomItalic', '\<import\>')
  call matchadd('CustomItalic', '\<from\>')
  call matchadd('CustomItalic', '\<const\>')
  call matchadd('CustomItalic', '\<let\>')
  call matchadd('CustomItalic', '\<async\>')
  call matchadd('CustomItalic', '\<await\>')
]]


function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap("<leader>nt", ":NvimTreeToggle<CR>")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

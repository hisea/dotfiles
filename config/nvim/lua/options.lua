
-- Colorscheme
-- vim.cmd.colorscheme "catppuccin-macchiato"  -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

vim.opt.termguicolors = true

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

vim.o.hlsearch = true

vim.opt.listchars = {
  tab = "  ",
  trail = ".",
  extends = ">",
  precedes = "<",
}

-- Set highlight on search
vim.o.hlsearch = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true


require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>rr", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
	  hover_actions = {
		  -- the border that is used for the hover window
		  -- see vim.api.nvim_open_win()
		  border = {
			  { "╭", "NormalFloat" },
			  { "─", "NormalFloat" },
			  { "╮", "NormalFloat" },
			  { "│", "NormalFloat" },
			  { "╯", "NormalFloat" },
			  { "─", "NormalFloat" },
			  { "╰", "NormalFloat" },
			  { "│", "NormalFloat" },
		  }
	  },
  }
})


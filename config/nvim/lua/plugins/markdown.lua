return {
  {
    "echasnovski/mini.align",
    version = "*",
    opts = function(_, opts)
      require("mini.align").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.markdownlint,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  -- Markdown preview
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   enabled = vim.fn.executable("npm") == 1,
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && npm install",
  --
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown", "telekasten" }
  --     vim.g.mkdp_auto_close = 0
  --     vim.g.mkdp_command_for_global = 1
  --     vim.g.mkdp_combine_preview = 1
  --
  --     local function load_then_exec(cmd)
  --       return function()
  --         vim.cmd.delcommand(cmd)
  --         require("lazy").load({ plugins = { "markdown-preview.nvim" } })
  --         vim.api.nvim_exec_autocmds("BufEnter", {}) -- commands appear only after BufEnter
  --         vim.cmd(cmd)
  --       end
  --     end
  --
  --     ---Fixes "No command :MarkdownPreview"
  --     ---https://github.com/iamcco/markdown-preview.nvim/issues/585#issuecomment-1724859362
  --     for _, cmd in pairs({ "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" }) do
  --       vim.api.nvim_create_user_command(cmd, load_then_exec(cmd), {})
  --     end
  --   end,
  -- },
  require("render-markdown").setup({
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
      -- Replaces '-'|'+'|'*' of 'list_item'
      -- How deeply nested the list is determines the 'level'
      -- The 'level' is used to index into the array using a cycle
      -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
      icons = { "●", "○", "◆", "◇" },
      -- Padding to add to the right of bullet point
      right_pad = 1,
      -- Highlight for the bullet icon
      highlight = "RenderMarkdownBullet",
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = "󰄱 ",
        -- Highlight for the unchecked icon
        highlight = "RenderMarkdownUnchecked",
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        icon = " ",
        -- Highligh for the checked icon
        highlight = "RenderMarkdownChecked",
      },
      -- Define custom checkbox states, more involved as they are not part of the markdown grammar
      -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
      -- Can specify as many additional states as you like following the 'todo' pattern below
      --   The key in this case 'todo' is for healthcheck and to allow users to change its values
      --   'raw': Matched against the raw text of a 'shortcut_link'
      --   'rendered': Replaces the 'raw' value when rendering
      --   'highlight': Highlight for the 'rendered' icon
      custom = {
        wip = { raw = "[~]", rendered = "󰥔 ", highlight = "RenderMarkdownHint" },
        delegate = { raw = "[>]", rendered = " ", highlight = "DiagnosticInfo" },
        blocked = { raw = "[!]", rendered = " ", highlight = "DiagnosticWarn" },
      },
    },
  }),
}

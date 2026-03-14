return {
  {
    "nvim-mini/mini.align",
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
    "mason-org/mason.nvim",
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}

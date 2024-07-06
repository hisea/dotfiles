return {
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
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
          fat_headline_upper_string = "",
          fat_headline_lower_string = "",
          -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
          bullets = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}

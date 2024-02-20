-- return {
--   "mrcjkb/rustaceanvim",
--   version = "^4", -- Recommended
--   ft = { "rust" },
-- }
--
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          mason = false,
          cmd = { vim.fn.expand("~/.cargo/bin/rust-analyzer") },
          settings = {
            ["rust-analyzer"] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}

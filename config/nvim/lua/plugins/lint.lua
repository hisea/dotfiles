return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "~/.config/linter/markdownlint-cli2.yaml", "--" },
      },
    },
  },
}

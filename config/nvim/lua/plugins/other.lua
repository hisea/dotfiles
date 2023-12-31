return {
  "folke/neodev.nvim",
  'todo-comments.nvim',
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    "adityastomar67/italicize",
    config = function()
      require("italicize").setup({
        transparency = false,
        italics = true,
        exclude_italics_group = {
          "String",
        }
      })
    end
  },
}

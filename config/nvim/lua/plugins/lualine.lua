return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- table.insert(opts.options, { section_separators = { left = "", right = "" } })
    opts["options"]["section_separators"] = { left = "", right = "" }
    opts["options"]["component_separators"] = { left = "", right = "" }
  end,
}

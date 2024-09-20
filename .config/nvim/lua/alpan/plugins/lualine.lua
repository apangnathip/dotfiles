return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trans_auto = require("lualine.themes.auto")

    trans_auto.normal.c.bg = ""
    trans_auto.insert.c.bg = ""
    trans_auto.visual.c.bg = ""
    trans_auto.replace.c.bg = ""
    trans_auto.command.c.bg = ""
    trans_auto.inactive.c.bg = ""

    require("lualine").setup({
      options = {
        theme = trans_auto,
        component_separators = { left = ">", right = "<" },
      },
    })
  end,
}

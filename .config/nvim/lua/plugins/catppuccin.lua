vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" }
})

require("catppuccin").setup({
  transparent_background = true,
  term_colors = true,
  intergrations = {
    lualine = true,
    noice = true,
    blink_cmp = true,
    mason = true,
  },
  custom_hightlights = function (colors)
    return {
      LineNr     = { fg = colors.surface2 },
      Visual     = { bg = colors.overlay0 },
      Search     = { bg = colors.surface2 },
      IncSearch  = { bg = colors.mauve },
      CurSearch  = { bg = colors.mauve },
      MatchParen = { bg = colors.mauve, fg = colors.base, blod = true },
    }
  end,
})
vim.cmd("colorscheme catppuccin")





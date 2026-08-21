vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim'
})
require("lualine").setup({
  options = {
   theme = catppuccin, -- catppuccin
   always_divide_middle = false,
   component_separators = { left = "", right = "" },
   -- section_separators = { left = "", right = "" },
  },
  sections = {
   lualine_a = { "mode" },
   lualine_b = { "diagnostics", "filename" },
   lualine_c = {},
   lualine_x = {},
   lualine_y = { "encoding", "filetype", "progress" },
   lualine_z = { "location" },
  },
})


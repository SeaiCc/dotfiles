local configured = false

local function setup()
  if configured then
    return require("snacks")
  end
  configured = true
  vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
  })

  local snacks = require("snacks")
  snacks.setup({
    
  })
  return snacks
end

local function map(key, func, desc)
  vim.keymap.set("n", key, func, { desc = desc })
end

local function with_snacks(callback)
  return function(...)
    return callback(setup(), ...)
  end
end

map("<leader>ff", with_snacks(function(snacks)
  snacks.picker.smart()
end), "Smart find file.")


vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("LoadSnackDashboard", { clear = true }),
  once = true,
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
    if vim.api.nvim_buf_get_name(buf) == "" and vim.bo[buf].buftype == "" and lines[i] == "" then
      setup()
    end
  end,
})

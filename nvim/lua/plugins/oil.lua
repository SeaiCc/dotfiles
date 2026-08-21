local configured = false

local function setup_oil()
  if configured then
    return require("oil")
  end

  pcall(vim.api.nvim_del_user_command, "Oil")
  vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" }
  })
  local oil = require("oil")
  oil.setup({
    default_file_explorer = true,
  })

  configured = true
  return oil
end

local function open_oil(path, count)
  setup_oil()
  local args = {}
  if path and path ~= "" then
    arg[#args + 1] = path
  end
  local cmd = { cmd = "Oil", args = args}
  if count and count > 0 then
    cmd.count = count
  end
  vim.cmd(cmd)
end

vim.keymap.set("n", "<leader>e", function()
  open_oil(nil, 0)
end)

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("LazyLoadOil", { clear = true }),
  callback = function(ev)
    if configured then
      return
    end

    local bufnr = ev.buf or vim.api.nvim_get_current_buf()
    if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname == "" or vim.fn.isdirectory(bufname) == 0 then
      return
    end

    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      open_oil(bufname, 0)
    end)
  end,
})

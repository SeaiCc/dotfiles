vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("SetupMason", { clear = true }),
  once = true,
  callback = function()
    require("mason").setup()
  end
})

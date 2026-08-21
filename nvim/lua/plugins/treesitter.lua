vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFIle' }, {
  group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
  once = true,
  callback = function ()
    vim.pack.add({
      { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    })
    require("tree-sitter-manager").setup {
      ensure_installed = { "c", "vim", "vimdoc", "query", "diff" },
      ignore_install = { "yaml" },
      auto_install = true,
      highlight = true,
    }
  end,
})



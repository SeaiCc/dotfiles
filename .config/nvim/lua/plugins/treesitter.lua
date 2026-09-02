vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
  once = true,
  callback = function ()
    vim.pack.add({
      { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
      { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
    })
    require("tree-sitter-manager").setup {
      ensure_installed = { "c", "vim", "vimdoc", "query", "diff" },
      ignore_install = { "yaml" },
      auto_install = true,
      highlight = true,
    }
    require("treesitter-context").setup({
      max_lines = 3,             -- 最多显示3行（3个层级）
      multiline_threshold = 1,   -- 每个层级最多1行（截断长参数列表）
    })
  end,
})



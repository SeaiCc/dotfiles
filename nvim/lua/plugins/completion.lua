vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter"}, {
  group = vim.api.nvim_create_augroup("SetupCompeltion", { clear = true }),
  once = true,
  callback = function()
    vim.pack.add({
      { src = "https://github.com/saghen/blink.lib" },
      { src = "https://github.com/saghen/blink.cmp" },
    })
    require("blink.cmp").build():wait()
    require("blink.cmp").setup({
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = "none",
            scrollbar = false,
          },
        },
        menu = {
          border = "none",
          auto_show = true,
          auto_show_delay_ms = 0,
          scrollbar = false,
        },
      },
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-m>"] = { "show_signature", "hide_signature", "fallback" },
        ["<C-k>"] = false,
      },
      signature = {
        enabled = true,
        window = { border = "single" },
      },
    })
  end
})

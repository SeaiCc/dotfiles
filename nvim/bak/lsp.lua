--vim.pack.add({
--    { src = "https://github.com/mason-org/mason.nvim" },
--    { src = "https://github.com/neovim/nvim-lspconfig" },
--})

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    -- example call setup directly for each LSP
    config = function ()
      vim.diagnostic.config({
        underline = false,
        signs = false,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        serverity_sort = true,
        float = {
          border = "rounded",
        },
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover)
          vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, {desc = "[LSP] Signature help" })
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[LSP] Add worksapce folder" })
          vim.keymap.set(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            { desc = "[LSP] Remove workspace folder" }
          )
          vim.keymap.set("n", "<leader>wl", function ()
            print(vim.inspect(vim.lsp.buf.remove_workspace_folders()))
          end, { desc = "[LSP] List workspace folders" })
        end,
      })
    end
  }
}

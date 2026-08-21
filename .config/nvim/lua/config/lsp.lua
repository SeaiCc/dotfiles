vim.lsp.enable "lua_ls"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- obtain LSP client
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- [basic keymaps]
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,  { buffer = event.buf, desc = "LSP: Goto Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: Goto Declaration" })

    -- [diagnostics]
    vim.diagnostic.config({
      underline = false,
      update_in_insert = false,
      virtual_text = { spacing = 2, prefix = "●" },
      float = { border = "rounded" },
      serverity_sort = true,
      signs = false,
    })


    -- float window
    vim.keymap.set("n", "<leader>d", function ()
      vim.diagnostic.open_float { source = true }
    end, { buffer = event.buf, desc = "LSP: Show Diagnostic" })
    -- vim.keymap.set(
    --   "n",
    --   "<leader>td",
    --   (function()
    --     local diag_status = 1 -- 1 is show, 0 is hide
    --     return function()
    --      if diag_status == 1 then
    --         diag_status = 0
    --         vim.diagnostic.config { underline = false, virtual_text = false, signs = false, update_in_insert = false }
    --       else
    --         diag_status = 1
    --         vim.diagnostic.config { underline = false, virtual_text = true, signs = false, update_in_insert = true }
    --       end
    --     end
    --   end)(),
    --   { buffer = event.buf, desc = "LSP: Toggle Diagnostisc"}
    -- )

    -- folding
    if client and client:supports_method "textDocument/flodingRange" then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    -- highlight words under cursor
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHightlight) then
      local hightlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-hightlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- offloads upon detachment
    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds{ group = "kickstart-lsp-hightlight", buffer = event2.buf }
      end
    })
  end,
})


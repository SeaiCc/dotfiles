vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set("i", "jk", "<Esc>")

-- vim-tmux-navigator 插件会接管 Ctrl+hjkl，安装后不需要以下映射
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set({ "n", "x" }, "<S-H>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "x" }, "<S-L>", "$", { desc = "End of line" })
vim.keymap.set("n", "y<S-H>", "y^", { desc = "Yank from start of line" })
vim.keymap.set("n", "y<S-L>", "y$", { desc = "Yank from end of line" })

vim.keymap.set({ "n", "x" }, "Q", "<CMD>:qa<CR>")
vim.keymap.set({ "n", "x" }, "qq", "<CMD>q<CR>")

vim.keymap.set("n", "<leader>zz", "<CMD>set wrap!<CR>", { desc = "Toggle line wrap" })

-- leader+z then 0~3 设置折叠层级
vim.keymap.set("n", "<leader>z0", "<CMD>set foldlevel=0<CR>", { desc = "Fold level 0" })
vim.keymap.set("n", "<leader>z1", "<CMD>set foldlevel=1<CR>", { desc = "Fold level 1" })
vim.keymap.set("n", "<leader>z2", "<CMD>set foldlevel=2<CR>", { desc = "Fold level 2" })
vim.keymap.set("n", "<leader>z3", "<CMD>set foldlevel=3<CR>", { desc = "Fold level 3" })

vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy relative file path" })



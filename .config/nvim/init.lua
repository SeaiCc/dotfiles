if vim.loader then
    vim.loader.enable()
end

require("config.options")
require("config.keymaps") 
require("config.autocmds")
require("config.mason")
require("config.lsp")

-- core plugins
require("plugins.catppuccin")
require("plugins.mini")
require("plugins.oil")
require("plugins.snacks")
require("plugins.lualine")    -- loaded when open file
require("plugins.completion") -- loaded when INSERT/CMD
require("plugins.treesitter") -- loaded when events
require("plugins.debugging")  -- loaded at filetypes
require("plugins.tmux-navigator")
--require("plugins.markdown")   -- md file (see :h after-directory)
-- require("plugins.lsp")        -- kinda special, mix of `lsp` and `after` dirs





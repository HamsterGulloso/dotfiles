vim.pack.add({'git@github.com:tpope/vim-sleuth'})

-- setup comments with 'gc${motion}'
vim.pack.add({"git@github.com:numToStr/Comment.nvim"})
require'Comment'.setup{}

-- Align plugin
vim.pack.add({"git@github.com:nvim-mini/mini.align"})
require"mini.align".setup{}

require("plugins.git-signs")
require("plugins.formatter")
require("plugins.tree-sitter")
require("plugins.tree-sitter-context")
require("plugins.lsp-config")
require("plugins.auto-complete")
-- require("plugins.copilot")
require("plugins.debugger")
require("plugins.oil")
require("plugins.database")
-- require("plugins.image")

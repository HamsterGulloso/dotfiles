local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- auto set indent
    'tpope/vim-sleuth',

    -- setup comments with 'gc${motion}'
    "numToStr/Comment.nvim",

    -- Align plugin
    {
	"nvim-mini/mini.align",
        config = function()
            require("mini.align").setup{}
        end
    },

    require("plugins.git-signs"),
    require("plugins.formatter"),
    require("plugins.tree-sitter"),
    require("plugins.tree-sitter-context"),
    require("plugins.lsp-config"),
    require("plugins.auto-complete"),
    -- require("plugins.copilot"),
    require("plugins.debugger"),
    require("plugins.oil"),
    require("plugins.database"),
    require("plugins.image"),
}, {})

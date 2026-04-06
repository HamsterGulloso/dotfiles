vim.pack.add({'git@github.com:nvim-treesitter/nvim-treesitter'})

-- Dependencies
vim.pack.add({'git@github.com:nvim-treesitter/nvim-treesitter-textobjects'})
require("nvim-treesitter").setup{
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
vim.cmd("TSEnable highlight")
vim.cmd("TSEnable textobjects.select")
vim.cmd("TSEnable textobjects.move")
vim.cmd("TSEnable textobjects.swap")
vim.cmd("TSEnable textobjects.lsp_interop")

require("nvim-treesitter.configs").setup({
    textobjects = {
        select = {
            enable = true,

            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = "@statement.outer",
                ["is"] = "@statement.inner",
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
        },
    },
})

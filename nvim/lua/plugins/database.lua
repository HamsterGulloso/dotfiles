vim.pack.add{
    'git@github.com:kristijanhusak/vim-dadbod-ui',

    -- Dependencies:
    'git@github.com:tpope/vim-dadbod',                     -- lazy = true },
    'git@github.com:kristijanhusak/vim-dadbod-completion', -- ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "mysql", "plsql" },
    callback = function()
        vim.keymap.set("v", "<C-CR>", ":DB<CR>", { buffer = true, desc = "Execute selected SQL" })
        vim.keymap.set("n", "<C-CR>", "vas:DB<CR>", { buffer = true, desc = "Execute selected SQL" })
    end
})

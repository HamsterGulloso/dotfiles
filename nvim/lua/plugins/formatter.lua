vim.pack.add({'git@github.com:stevearc/conform.nvim'})
local conform = require("conform")

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        conform.format({ bufnr = args.buf })
    end,
})

vim.keymap.set('', 'gf', function()
    conform.format({ async = true, lsp_format = 'fallback' })
end, { desc = '[F]ormat buffer' })

vim.api.nvim_create_user_command('ConformInfo', function()
    conform.info()
end, {})

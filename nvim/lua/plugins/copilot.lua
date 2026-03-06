return {
    'github/copilot.vim',
    config = function()
        -- copilot config
        vim.api.nvim_set_keymap('i', '<C-Right>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

        vim.api.nvim_set_keymap('i', '<C-Down>', 'copilot#Next()', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Next()', { expr = true, silent = true })

        vim.api.nvim_set_keymap('i', '<C-Up>', 'copilot#Previous()', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-k>', 'copilot#Previous()', { expr = true, silent = true })

        vim.api.nvim_set_keymap('i', '<C-Left>', 'copilot#Clear()', { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-h>', 'copilot#Clear()', { expr = true, silent = true })

        vim.g.copilot_no_tab_map = true
    end
}

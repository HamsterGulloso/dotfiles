return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        columns = {
            "icon",
            "permissions",
            -- "size",
            -- "mtime",
        },
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ["<CR>"] = "actions.select",
            ["g."] =  "actions.toggle_hidden",
            ["cd"] = "actions.cd",
            ["<BS>"] = "actions.parent",
            ["<C-CR>"] = {
                "actions.select",
                opts = {
                    vertical = true,
                },
            },
            ["<S-CR>"] = {
                "actions.select",
                opts = {
                    horizontal = true,
                },
            },
        },
        use_default_keymaps = false,
        view_options = {
            show_hidden = true,
        },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,

}

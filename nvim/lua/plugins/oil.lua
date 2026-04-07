vim.pack.add({"git@github.com:nvim-mini/mini.icons"})
require("mini.icons").setup{}
vim.pack.add({'git@github.com:stevearc/oil.nvim'})
require("oil").setup{
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
}

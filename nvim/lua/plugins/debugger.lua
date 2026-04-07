vim.pack.add{
    "git@github.com:mfussenegger/nvim-dap",

    -- Dependencies:
    "git@github.com:rcarriga/nvim-dap-ui",
    "git@github.com:nvim-neotest/nvim-nio",
}

local ui = require("dapui")
local dap = require('dap')
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python',     -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}",     -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end,
    },
}
ui.setup()

vim.keymap.set({ "n", "v" }, "gBB", dap.toggle_breakpoint)
vim.keymap.set({ "n", "v" }, "gBS", dap.continue)
vim.keymap.set({ "n", "v" }, "gBL", dap.step_into)
vim.keymap.set({ "n", "v" }, "gB<S-Left>", dap.step_into)
vim.keymap.set({ "n", "v" }, "gBJ", dap.step_over)
vim.keymap.set({ "n", "v" }, "gB<S-Down>", dap.step_over)
vim.keymap.set({ "n", "v" }, "gBH", dap.step_out)
vim.keymap.set({ "n", "v" }, "gB<S-Right>", dap.step_out)
vim.keymap.set({ "n", "v" }, "gBK", dap.step_back)
vim.keymap.set({ "n", "v" }, "gB<S-Up>", dap.step_back)
vim.keymap.set({ "n", "v" }, "gBR", dap.restart)

vim.keymap.set({ "n", "v" }, "gBU", ui.toggle)

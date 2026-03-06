-- require("colorscheme.sly-dark")
vim.cmd("colorscheme habamax")
vim.cmd("hi! Normal ctermbg=NONE guibg=NONE")

require("install-plugins")

vim.o.number = true
vim.o.relativenumber = true
vim.o.completeopt = 'menuone,noselect'
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.wrap = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 5

-- personal mappings
vim.keymap.set({ "n", "v" }, "<C-x>", '"_d') -- not copying delete
vim.keymap.set("v", "<C-p>", 'pgvy')         -- not copying visual paste
vim.keymap.set("v", "g<C-u>", ":!iconv -tASCII//translit<CR>")

vim.keymap.set("n", "<C-w>.", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-w>,", ":vertical resize -5<CR>")

-- set clipboard
vim.cmd("set clipboard=unnamedplus")

-- Treesitter folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

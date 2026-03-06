return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 0
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "mysql", "plsql" },
        callback = function()
          vim.keymap.set("v", "<C-CR>", ":DB<CR>", { buffer = true, desc = "Execute selected SQL" })
          vim.keymap.set("n", "<C-CR>", "vas:DB<CR>", { buffer = true, desc = "Execute selected SQL" })
        end
      })
    end
  },
}

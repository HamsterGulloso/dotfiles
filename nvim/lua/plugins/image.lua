vim.pack.add{"git@github.com:3rd/image.nvim"}

require"image".setup{
    processor = "magick_cli",
}

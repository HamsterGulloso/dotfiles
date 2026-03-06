local colors = {
    whitesmoke = "#bbbbbb",
    sly = {
        blue = "#0066cc",
        blue_bright = "#0099ff",
        lightrings = "#999999",
        darkrings = "#333333",
        gold = "#f1c100",
    },
    murray = {
        purple = "#c06187",
        red = "#7d0000",
        red_bright = "#a30101",
        scarf_dim = "#74baba"
    },
    bentley = {
        green_bright = "#53a452",
    },
    carmelita = {
        brown = "#cf6933",
        skin = "#ffcf65",
        blue = "#343469",
        red = "#990000",
        lime = "#cf9a00"
    },
}

local function highlight(type, guifg, bold)
    local b_string = ""
    if bold then
        b_string = "bold"
    else
        b_string = "NONE"
    end
    vim.cmd(
        string.format(
            "hi! %s guifg=%s gui=%s",
            type,
            guifg,
            b_string
        )
    )
end
local function link(type, to)
    vim.cmd(
        string.format(
            "hi! link %s %s",
            type,
            to
        )
    )
end

vim.cmd("colorscheme habamax")
-- vim.cmd("hi! clear")
vim.cmd("hi! Normal ctermbg=NONE guibg=NONE")

highlight("Normal", colors.whitesmoke)

-- Murray colors
highlight("Statement", colors.murray.purple)
highlight("Operator", colors.murray.purple)
highlight("Identifier", colors.murray.scarf_dim)
highlight("Function", colors.murray.scarf_dim)
link("@variable", "Identifier")

-- Carmelita colors
highlight("PreProc", colors.carmelita.lime)

-- Bentley's green
highlight("String", colors.bentley.green_bright)
highlight("Constant", colors.bentley.green_bright)
link("@constant", "Constant")
highlight("MoreMsg", colors.bentley.green_bright)

-- Sly's blue
highlight("Type", colors.sly.blue_bright)
highlight("Directory", colors.sly.blue_bright)

-- The Cane
highlight("DiagnosticWarn", colors.sly.gold)

-- Ringtail session
highlight("LineNr", colors.sly.lightrings)
highlight("Comment", colors.sly.lightrings)
-- highlight("Delimiter", colors.sly.lightrings)
highlight("LineNrAbove", colors.sly.darkrings)
highlight("LineNrBelow", colors.sly.darkrings)
highlight("SpecialKey", colors.sly.darkrings)
highlight("NonText", colors.sly.darkrings)
highlight("EndOfBuffer", colors.sly.darkrings)
highlight("FoldColumn", colors.sly.darkrings)
highlight("Conceal", colors.sly.darkrings)

-- Murray's mask
highlight("DiagnosticError", colors.murray.red_bright)

local sly_darker = "#4b5599"
local sly_darker_alpha = "#4b559933"
local sly_brighter = "#5fbde1"
local sly_brighter_alpha = "#5fbde133"
local inactive_color = "#777777"
local active_color = "#f5f5f5"

local animation_name = "linear"

hl.curve(
    animation_name,
    {
        type = "bezier",
        points = {
            {0, 0},
            {1, 1},
        }
    }
)

return {
    sly_darker = sly_darker,
    sly_darker_alpha = sly_darker_alpha,
    sly_brighter = sly_brighter,
    sly_brighter_alpha = sly_brighter_alpha,
    inactive_color = inactive_color,
    active_color = active_color,

    active_border = {
        colors = {sly_darker, sly_brighter},
        angle = 45,
    },

    inactive_border = {
        colors = {sly_darker_alpha, sly_brighter_alpha},
        angle = 45,
    },

    warning_border = {
        colors = {"#ff000033",  "#ff0000ff"},
        angle = 45,
    },

    font = "Iosevka Nerd Font",
    font_color = active_color,

    rounding = 0,

    animation_name = animation_name,
}

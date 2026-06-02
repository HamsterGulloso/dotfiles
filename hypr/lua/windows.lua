local theme = require("lua.theme")

hl.config{
    general = {
        gaps_in = 0,
        gaps_out = 0,

        border_size = 2,

        col = {
            active_border = theme.active_border,
            inactive_border = theme.inactive_border,
        },

        resize_on_border = true,

        allow_tearing = false,

        layout = "scrolling",
    },
    decoration = {
        rounding = 0,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 0.95,
        inactive_opacity = 0.9,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "#1a1a1aee",
        },

        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur  = {
            enabled = true,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },
    group = {
        col = {
            border_active = theme.active_border,
            border_inactive = theme.inactive_border,
        },
        groupbar = {
            font_size = 11,
            gradients = true,
            col = {
                active = "#000000",
                inactive = "#000000",
            },
            text_color = theme.active_color,
            text_color_inactive = theme.inactive_color,
        },
    },
    animations = {
        -- enabled = false
        enabled = true

        -- Old format
        -- # enabled = no
        -- bezier = $linear
        -- animation = $animation
    },
    misc = {
        force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        background_color = "#000000",
    },
    cursor = {
        hide_on_key_press = true
    },
}

hl.curve(
    "linear",
    {
        type = "bezier",
        points = {
            {0, 0},
            {1, 1},
        }
    }
)

hl.animation{
    leaf = "global",
    enabled = true,
    speed = 1,
    curve = "linear",
}
--
-- # https://wiki.hypr.land/Configuring/Variables/#animations
-- animations {
--     enabled = yes, please :)
--     # enabled = no
--
--     bezier = $linear
--     animation = $animation
-- }
--
-- dwindle {
--     # pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
--     preserve_split = true # You probably want this
-- }
--
-- master {
--     new_status = master
--     mfact = 0.75
-- }
--
--
-- windowrule {
--   name = windowrule-1
--   suppress_event = maximize
--   match:class = .*
-- }
--
--
-- windowrule {
--   name = windowrule-2
--   no_focus = on
--   match:class = ^$
--   match:title = ^$
--   match:xwayland = 1
--   match:float = 1
--   match:fullscreen = 0
--   match:pin = 0
-- }
--

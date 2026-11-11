local programs = require("lua.programs")
local utils = require("lua.utils")

local function mod_key(str)
    return ("SUPER + %s"):format(str)
end

hl.bind(
    "switch:on:Lid Switch",
    utils.lock_and_suspend,
    { locked = true }
)

-- Test binding
-- hl.bind(super("Q"),         utils.test, {locked = true})

-- Programs
hl.bind(mod_key("T"),         hl.dsp.exec_cmd(programs.terminal))
hl.bind(mod_key("RETURN"),    hl.dsp.exec_cmd(programs.terminal))
hl.bind(mod_key("I"),         hl.dsp.exec_cmd(programs.impala))
hl.bind(mod_key("C"),         hl.dsp.exec_cmd(programs.bluetui))
hl.bind(mod_key("SHIFT + C"), hl.dsp.exec_cmd(programs.calculator))
hl.bind(mod_key("E"),         hl.dsp.exec_cmd(programs.file_manager))
hl.bind(mod_key("R"),         hl.dsp.exec_cmd(programs.menu))
hl.bind(mod_key("B"),         hl.dsp.exec_cmd(programs.browser))
hl.bind(mod_key("SHIFT + B"), hl.dsp.exec_cmd(programs.browser_private))
hl.bind(mod_key("V"),         hl.dsp.exec_cmd(programs.wiremix))
hl.bind(mod_key("SHIFT + S"), hl.dsp.exec_cmd(programs.spotify))

hl.bind(mod_key("SPACE"),          hl.dsp.exec_cmd(programs.menu))
hl.bind(mod_key("ESCAPE"),         hl.dsp.exec_cmd(programs.lock))
hl.bind(mod_key("SHIFT + ESCAPE"), hl.dsp.exit(),            {locked = true})
hl.bind(mod_key("CTRL + ESCAPE"),  utils.lock_and_hibernate, {locked = true})

hl.bind("Print",         hl.dsp.exec_cmd(programs.grim_slurp))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(programs.grim))

-- General
hl.bind(mod_key("W"),                  hl.dsp.window.close())
hl.bind(mod_key("SHIFT + W"),          hl.dsp.window.kill())
hl.bind(mod_key("SHIFT + F"),          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod_key("M"),                  utils.switch_layout("monocle"))
hl.bind(mod_key("SHIFT + M"),          utils.switch_layout("master"))
hl.bind(mod_key("S"),                  utils.switch_layout("scrolling"))
hl.bind(mod_key("D"),                  utils.switch_layout("dwindle"))
hl.bind(mod_key("F"),                  hl.dsp.window.fullscreen())
hl.bind(mod_key("G"),                  hl.dsp.group.toggle())
hl.bind(mod_key("CTRL + TAB"),         hl.dsp.group.next())
hl.bind(mod_key("CTRL + SHIFT + TAB"), hl.dsp.group.next())
hl.bind(mod_key("L"),                  utils.cycle_xkblayout, {locked = true})

-- Monocle
hl.bind(mod_key("TAB"), utils.if_layout(
    "monocle",
    hl.dsp.layout("cyclenext")
))
hl.bind(mod_key("SHIFT + TAB"), utils.if_layout(
    "monocle",
    hl.dsp.layout("cycleprev")
))

-- Move focus with mainMod + arrow keys
hl.bind(mod_key("left"),  hl.dsp.focus { direction = "l" })
hl.bind(mod_key("right"), hl.dsp.focus { direction = "r" })
hl.bind(mod_key("up"),    hl.dsp.focus { direction = "u" })
hl.bind(mod_key("down"),  hl.dsp.focus { direction = "d" })

-- Move window like the above
hl.bind(mod_key("SHIFT + left"),  hl.dsp.window.move { direction = "l" })
hl.bind(mod_key("SHIFT + right"), hl.dsp.window.move { direction = "r" })
hl.bind(mod_key("SHIFT + up"),    hl.dsp.window.move { direction = "u" })
hl.bind(mod_key("SHIFT + down"),  hl.dsp.window.move { direction = "d" })

-- Move group like the above
hl.bind(mod_key("CTRL + left"),  hl.dsp.window.move { direction = "l", group_aware = true })
hl.bind(mod_key("CTRL + right"), hl.dsp.window.move { direction = "r", group_aware = true })
hl.bind(mod_key("CTRL + up"),    hl.dsp.window.move { direction = "u", group_aware = true })
hl.bind(mod_key("CTRL + down"),  hl.dsp.window.move { direction = "d", group_aware = true })

-- Switch workspaces with mainMod + [0-9]
hl.bind(mod_key("1"), hl.dsp.focus { workspace = 1 })
hl.bind(mod_key("2"), hl.dsp.focus { workspace = 2 })
hl.bind(mod_key("3"), hl.dsp.focus { workspace = 3 })
hl.bind(mod_key("4"), hl.dsp.focus { workspace = 4 })
hl.bind(mod_key("5"), hl.dsp.focus { workspace = 5 })
hl.bind(mod_key("6"), hl.dsp.focus { workspace = 6 })
hl.bind(mod_key("7"), hl.dsp.focus { workspace = 7 })
hl.bind(mod_key("8"), hl.dsp.focus { workspace = 8 })
hl.bind(mod_key("9"), hl.dsp.focus { workspace = 9 })
hl.bind(mod_key("0"), hl.dsp.focus { workspace = 10 })

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mod_key("SHIFT + 1"), hl.dsp.window.move { workspace = 1 })
hl.bind(mod_key("SHIFT + 2"), hl.dsp.window.move { workspace = 2 })
hl.bind(mod_key("SHIFT + 3"), hl.dsp.window.move { workspace = 3 })
hl.bind(mod_key("SHIFT + 4"), hl.dsp.window.move { workspace = 4 })
hl.bind(mod_key("SHIFT + 5"), hl.dsp.window.move { workspace = 5 })
hl.bind(mod_key("SHIFT + 6"), hl.dsp.window.move { workspace = 6 })
hl.bind(mod_key("SHIFT + 7"), hl.dsp.window.move { workspace = 7 })
hl.bind(mod_key("SHIFT + 8"), hl.dsp.window.move { workspace = 8 })
hl.bind(mod_key("SHIFT + 9"), hl.dsp.window.move { workspace = 9 })
hl.bind(mod_key("SHIFT + 0"), hl.dsp.window.move { workspace = 10 })

-- Move active group to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mod_key("CTRL + 1"), hl.dsp.group.active { index = 1 })
hl.bind(mod_key("CTRL + 2"), hl.dsp.group.active { index = 2 })
hl.bind(mod_key("CTRL + 3"), hl.dsp.group.active { index = 3 })
hl.bind(mod_key("CTRL + 4"), hl.dsp.group.active { index = 4 })
hl.bind(mod_key("CTRL + 5"), hl.dsp.group.active { index = 5 })
hl.bind(mod_key("CTRL + 6"), hl.dsp.group.active { index = 6 })
hl.bind(mod_key("CTRL + 7"), hl.dsp.group.active { index = 7 })
hl.bind(mod_key("CTRL + 8"), hl.dsp.group.active { index = 8 })
hl.bind(mod_key("CTRL + 9"), hl.dsp.group.active { index = 9 })
hl.bind(mod_key("CTRL + 0"), hl.dsp.group.active { index = 10 })

-- # Scroll through existing workspaces with mainMod + scroll
-- bind = SUPER, mouse_down, workspace, e+1
-- bind = SUPER, mouse_up, workspace, e-1
--
-- # Move/resize windows with mainMod + LMB/RMB and dragging
-- bindm = SUPER, mouse:272, movewindow
-- bindm = SUPER, mouse:273, resizewindow

-- resizing
hl.bind(mod_key("period"), hl.dsp.window.resize { x = 50,  y = 0,   relative = true })
hl.bind(mod_key("comma"),  hl.dsp.window.resize { x = -50, y = 0,   relative = true })
hl.bind(mod_key("equal"),  hl.dsp.window.resize { x = 0,   y = 50,  relative = true })
hl.bind(mod_key("minus"),  hl.dsp.window.resize { x = 0,   y = -50, relative = true })

-- Laptop multimedia keys for volume and
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true, locked = true }
)
hl.bind(
    "SHIFT + XF86AudioRaiseVolume",
    utils.ctrl_volume_active_window { percent = "5%+" },
    { repeating = true, locked = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true, locked = true }
)
hl.bind(
    "SHIFT + XF86AudioLowerVolume",
    utils.ctrl_volume_active_window { percent = "5%-" },
    { repeating = true, locked = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true }
)
hl.bind(
    "SHIFT + XF86AudioMute",
    utils.ctrl_volume_active_window { toggle_mute = true },
    { locked = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true }
)

-- Laptop multimedia keys for LCD brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { repeating = true, locked = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { repeating = true, locked = true }
)
hl.bind(
    "SHIFT + XF86MonBrightnessUp",
    hl.dsp.exec_cmd("hyprctl hyprsunset temperature +500"),
    { repeating = true, locked = true }
)
hl.bind(
    "SHIFT + XF86MonBrightnessDown",
    hl.dsp.exec_cmd("hyprctl hyprsunset temperature -500"),
    { repeating = true, locked = true }
)
hl.bind(
    "CTRL + XF86MonBrightnessUp",
    hl.dsp.exec_cmd("hyprctl hyprsunset temperature 6000"),
    { repeating = true, locked = true }
)
hl.bind(
    "CTRL + XF86MonBrightnessDown",
    hl.dsp.exec_cmd("hyprctl hyprsunset temperature 1000"),
    { repeating = true, locked = true }
)

-- Requires playerctl
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)
hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)
hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)
hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

local programs = require("lua.programs")
local utils = require("lua.utils")

local function super(str)
    return ("SUPER + %s"):format(str)
end

hl.bind(
    "switch:on:Lid Switch",
    utils.lock_and_suspend,
    { locked = true }
)

hl.bind(super("T"),         hl.dsp.exec_cmd(programs.terminal))
hl.bind(super("I"),         hl.dsp.exec_cmd(programs.impala))
hl.bind(super("C"),         hl.dsp.exec_cmd(programs.bluetui))
hl.bind(super("E"),         hl.dsp.exec_cmd(programs.fileManager))
hl.bind(super("R"),         hl.dsp.exec_cmd(programs.menu))
hl.bind(super("B"),         hl.dsp.exec_cmd(programs.browser))
hl.bind(super("SHIFT + B"), hl.dsp.exec_cmd(programs.browser_private))

hl.bind("Print",         hl.dsp.exec_cmd(programs.grim_slurp))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(programs.grim))

hl.bind(super("RETURN"),         hl.dsp.exec_cmd(programs.menu))
hl.bind(super("SPACE"),          hl.dsp.exec_cmd(programs.statusbar))
hl.bind(super("ESCAPE"),         hl.dsp.exec_cmd(programs.lock))
hl.bind(super("SHIFT + ESCAPE"), hl.dsp.exit())
hl.bind(super("CTRL + ESCAPE"),  hl.dsp.exec_cmd("systemctl poweroff"))

-- General
hl.bind(super("W"),                  hl.dsp.window.close())
hl.bind(super("SHIFT + W"),          hl.dsp.window.kill())
hl.bind(super("SHIFT + F"),          hl.dsp.window.float({ action = "toggle" }))
hl.bind(super("M"),                  utils.switch_layout("monocle"))
hl.bind(super("SHIFT + M"),          utils.switch_layout("master"))
hl.bind(super("D"),                  utils.switch_layout("scrolling"))
hl.bind(super("SHIFT + D"),          utils.switch_layout("dwindle"))
hl.bind(super("F"),                  hl.dsp.window.fullscreen())
hl.bind(super("G"),                  hl.dsp.group.toggle())
hl.bind(super("CTRL + TAB"),         hl.dsp.group.next())
hl.bind(super("CTRL + SHIFT + TAB"), hl.dsp.group.next())
hl.bind(super("L"),                  utils.cycle_xkblayout, {locked = true})
-- hl.bind(super("Д"),                  utils.cycle_xkblayout)
-- bind = SUPER,       P,   pseudo,            # dwindle
-- bind = SUPER,       J,   layoutmsg,         togglesplit #dwindle
-- bind = SUPER SHIFT, G,   moveoutofgroup,
-- bind = SUPER SHIFT, TAB, changegroupactive, b
-- bindl = SUPER, L, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next
-- bindl = SUPER, Д, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next

-- Monocle
hl.bind("SUPER + TAB", utils.if_layout(
    "monocle",
    hl.dsp.layout("cyclenext")
))
hl.bind("SUPER + SHIFT + TAB", utils.if_layout(
    "monocle",
    hl.dsp.layout("cycleprev")
))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus { direction = "l" })
hl.bind("SUPER + right", hl.dsp.focus { direction = "r" })
hl.bind("SUPER + up",    hl.dsp.focus { direction = "u" })
hl.bind("SUPER + down",  hl.dsp.focus { direction = "d" })

-- Move window like the above
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move { direction = "l" })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move { direction = "r" })
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move { direction = "u" })
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move { direction = "d" })

-- Move group like the above
hl.bind("SUPER + CTRL + left",  hl.dsp.window.move { direction = "l", group_aware = true })
hl.bind("SUPER + CTRL + right", hl.dsp.window.move { direction = "r", group_aware = true })
hl.bind("SUPER + CTRL + up",    hl.dsp.window.move { direction = "u", group_aware = true })
hl.bind("SUPER + CTRL + down",  hl.dsp.window.move { direction = "d", group_aware = true })

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus { workspace = 1 })
hl.bind("SUPER + 2", hl.dsp.focus { workspace = 2 })
hl.bind("SUPER + 3", hl.dsp.focus { workspace = 3 })
hl.bind("SUPER + 4", hl.dsp.focus { workspace = 4 })
hl.bind("SUPER + 5", hl.dsp.focus { workspace = 5 })
hl.bind("SUPER + 6", hl.dsp.focus { workspace = 6 })
hl.bind("SUPER + 7", hl.dsp.focus { workspace = 7 })
hl.bind("SUPER + 8", hl.dsp.focus { workspace = 8 })
hl.bind("SUPER + 9", hl.dsp.focus { workspace = 9 })
hl.bind("SUPER + 0", hl.dsp.focus { workspace = 10 })
hl.bind("SUPER + S", hl.dsp.focus { workspace = "special" })

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move { workspace = 1 })
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move { workspace = 2 })
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move { workspace = 3 })
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move { workspace = 4 })
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move { workspace = 5 })
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move { workspace = 6 })
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move { workspace = 7 })
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move { workspace = 8 })
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move { workspace = 9 })
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move { workspace = 10 })
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move { workspace = "special" })

-- Move active group to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + CTRL + 1", hl.dsp.group.active { index = 1 })
hl.bind("SUPER + CTRL + 2", hl.dsp.group.active { index = 2 })
hl.bind("SUPER + CTRL + 3", hl.dsp.group.active { index = 3 })
hl.bind("SUPER + CTRL + 4", hl.dsp.group.active { index = 4 })
hl.bind("SUPER + CTRL + 5", hl.dsp.group.active { index = 5 })
hl.bind("SUPER + CTRL + 6", hl.dsp.group.active { index = 6 })
hl.bind("SUPER + CTRL + 7", hl.dsp.group.active { index = 7 })
hl.bind("SUPER + CTRL + 8", hl.dsp.group.active { index = 8 })
hl.bind("SUPER + CTRL + 9", hl.dsp.group.active { index = 9 })
hl.bind("SUPER + CTRL + 0", hl.dsp.group.active { index = 10 })

-- # Scroll through existing workspaces with mainMod + scroll
-- bind = SUPER, mouse_down, workspace, e+1
-- bind = SUPER, mouse_up, workspace, e-1
--
-- # Move/resize windows with mainMod + LMB/RMB and dragging
-- bindm = SUPER, mouse:272, movewindow
-- bindm = SUPER, mouse:273, resizewindow

-- resizing
hl.bind("SUPER + period", hl.dsp.window.resize { x = 50,  y = 0,   relative = true })
hl.bind("SUPER + comma",  hl.dsp.window.resize { x = -50, y = 0,   relative = true })
hl.bind("SUPER + equal",  hl.dsp.window.resize { x = 0,   y = 50,  relative = true })
hl.bind("SUPER + minus",  hl.dsp.window.resize { x = 0,   y = -50, relative = true })

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

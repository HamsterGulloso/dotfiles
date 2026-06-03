local programs = require("lua.programs")

local function dunst_debug(str)
    hl.exec_cmd(("dunstify \"%s\""):format(str))
end
local function pidof(arg)
    return io.popen(("pidof %s"):format(arg)):read()
end

return {
    switch_layout = function(layout)
        return function()
            local curr_ws = hl.get_active_workspace()
            hl.workspace_rule{
                workspace = curr_ws.name,
                layout = layout
            }
        end
    end,
    if_layout = function(layout, dispatcher)
        return function()
            local curr_layout = hl.get_active_workspace().tiled_layout
            if layout == curr_layout then
                hl.dispatch(dispatcher)
            end
        end
    end,
    cycle_xkblayout = function()
        local kb_name = "sem-usb-keyboard"
        hl.exec_cmd(
            ("hyprctl switchxkblayout %s next"):format(
                kb_name
            )
        )
    end,
    ctrl_volume_active_window = function(args)
        local cmd = ""
        if args.toggle_mute then
            cmd = "wpctl set-mute -p %s @DEFAULT_AUDIO_SINK@ toggle"
        end
        if args.percent ~= nil then
            cmd = string.format(
                "wpctl set-volume -p %s -l 1 @DEFAULT_AUDIO_SINK@ %s",
                "%s", args.percent
            )
        end
        return function()
            local curr_win = hl.get_active_window()
            local pid = curr_win.pid
            local full_cmd = cmd:format(pid)
            hl.exec_cmd(cmd)
        end
    end,
    lock_and_hibernate = function()
        hl.exec_cmd("hyprlock")
        while pidof(programs.lock) == nil do
            hl.exec_cmd("sleep 1")
        end
        hl.exec_cmd("systemctl hibernate")
    end,
    lock_and_suspend = function()
        hl.exec_cmd("hyprlock")
        while pidof(programs.lock) == nil do
            hl.exec_cmd("sleep 1")
        end
        hl.exec_cmd("systemctl suspend")
    end,
    statusbar_toggle = function()
        if pidof(programs.statusbar) == nil then
            hl.exec_cmd(programs.statusbar)
        else
            hl.exec_cmd(("pkill %s"):format(programs.statusbar))
        end
    end,
}

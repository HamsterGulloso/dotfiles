local programs = require("lua.programs")

local function notify(str)
    hl.exec_cmd(("dunstify \"%s\""):format(str))
end
local function pidof(arg)
    return io.popen(("pidof %s"):format(arg)):read()
end
local function pipe(cmd)
    return io.popen(cmd):read()
end
local function lock_and_callback(callback)
    return function()
        local tried = false
        while pidof(programs.lock) == nil do
            if not tried then
                hl.exec_cmd("hyprlock")
                tried = true
            end
            hl.exec_cmd("sleep 1")
        end
        callback()
    end
end

return {
    test = function()
        local pid_lock = ("hyprlock: %s"):format(
            pidof("hyprlock")
        )
        local aw = hl.get_active_window()
        notify(pid_lock)
        notify(aw.pid)
    end,
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
    if_else_layout = function(layout, dispatcher_if, dispatcher_else)
        return function()
            local curr_layout = hl.get_active_workspace().tiled_layout
            if layout == curr_layout then
                hl.dispatch(dispatcher_if)
            else
                hl.dispatch(dispatcher_else)
            end
        end
    end,
    cycle_xkblayout = function()
        local kb_name = "at-translated-set-2-keyboard"
        hl.exec_cmd(
            ("hyprctl switchxkblayout %s next"):format(
                kb_name
            )
        )
    end,
    ctrl_volume_active_window = function(args)
        return function()
            local curr_win = hl.get_active_window()
            if curr_win == nil then
                return
            end
            local pid = curr_win.pid
            local cmd = ""
            if args.toggle_mute then
                cmd = string.format(
                    "wpctl set-mute -p %s toggle",
                    pid
                )
                notify("Toggled mute")
            end
            if args.percent ~= nil then
                cmd = string.format(
                    "wpctl set-volume -p %s -l 1 %s",
                    pid, args.percent
                )
                notify(("Volume changed in %s"):format(args.percent))
            end
            hl.exec_cmd(cmd)

            cmd = ("wpctl get-volume")
        end
    end,
    lock_and_hibernate = lock_and_callback(
        function()
            hl.dsp.dpms{ action = "off" }
            hl.exec_cmd("systemctl hibernate")
        end
    ),
    lock_and_suspend = lock_and_callback(
        function()
            hl.dsp.dpms{ action = "off" }
            hl.exec_cmd("systemctl suspend")
        end
    ),
    statusbar_toggle = function()
        if pidof(programs.statusbar) == nil then
            hl.exec_cmd(programs.statusbar)
        else
            hl.exec_cmd(("pkill %s"):format(programs.statusbar))
        end
    end,
}

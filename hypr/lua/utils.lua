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
    if_workspace = function(cond, dispatcher)
        return function()
            if (cond) then
                hl.dispatch(dispatcher)
            end
        end
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
}

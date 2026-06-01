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
        local curr_win = hl.get_active_window()
        local pid = curr_win.pid
        local cmd = ""
        if args.toggle_mute then
            cmd = string.format(
                "wpctl set-mute -p %s @DEFAULT_AUDIO_SINK@ toggle",
                pid
            )
        end
        if args.percent ~= nil then
            cmd = string.format(
                "wpctl set-volume -p %s -l 1 @DEFAULT_AUDIO_SINK@ %s",
                pid, args.percent
            )
        end
        return function()
            hl.exec_cmd(cmd)
        end
    end,
}

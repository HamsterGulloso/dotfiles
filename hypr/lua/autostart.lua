local programs = require("lua.programs")

---@param args {
    ---programs: string,
    ---user: boolean | nil,
---}
---@return nil
local function systemctl_start(args)
    local user = ""
    if args.user == nil or args.user then
        user = "--user"
    end
    hl.exec_cmd(
        ("systemctl %s start %s.service"):format(
            user,
            args.programs
        )
    )
end

hl.on("hyprland.start", function () 
    hl.exec_cmd(programs.statusbar)
    hl.exec_cmd(programs.wallpaper)
    systemctl_start{programs = "dunst.service"}
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd(
        programs.terminal,
        { workspace = 1 }
    )
    hl.exec_cmd(
        programs.browser,
        { workspace = "2 silent" }
    )
end)

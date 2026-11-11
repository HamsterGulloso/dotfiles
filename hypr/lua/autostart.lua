local programs = require("lua.programs")
local utils = require("lua.utils")

hl.on("hyprland.start", function () 
    hl.exec_cmd(programs.statusbar)
    hl.exec_cmd(programs.wallpaper)
    utils.systemctl_start{
        programs = "dunst.service",
        user = true,
    }
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

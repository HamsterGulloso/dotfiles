local programs = require("lua.programs")
hl.on("hyprland.start", function () 
    hl.exec_cmd(programs.statusbar)
    hl.exec_cmd(programs.wallpaper)
    hl.exec_cmd("systemctl --user start dunst.service")
    hl.exec_cmd(
        programs.terminal,
        { workspace = 1 }
    )
    hl.exec_cmd(
        programs.browser,
        { workspace = "2 silent" }
    )
end)

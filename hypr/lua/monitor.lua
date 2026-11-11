local utils = require("lua.utils")

if utils.pipe("cat /etc/hostname") == "daniel-arch" then
    hl.monitor{
        output = "eDP-1",
        mode = "preferred",
        position = "0x0",
        scale = "auto",
    }

    hl.workspace_rule{
        workspace = "1",
        monitor = "eDP-1",
    }
elseif utils.pipe("cat /etc/hostname") == "nti-arch" then
    hl.monitor{
        output = "HDMI-A-1",
        mode = "preferred",
        position = "0x0",
        scale = "auto",
    }
    hl.monitor{
        output = "VGA-1",
        mode = "preferred",
        position = "1920x0",
        scale = "auto",
    }

    hl.workspace_rule{
        workspace = "1",
        monitor = "HDMI-A-1",
    }
    hl.workspace_rule{
        workspace = "2",
        monitor = "VGA-1",
    }
end

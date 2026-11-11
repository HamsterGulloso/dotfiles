local terminal = "st"
local browser = "helium"

local function terminal_open_string(terminal, program)
    return ("%s -e %s"):format(
        terminal, program
    )
end

return {
    terminal = terminal,
    -- file_manager = "dolphin",
    file_manager = "nautilus",
    menu = "pkill wofi; wofi --show drun",
    browser = browser,
    browser_private = ("%s --incognito"):format(browser),
    lock = "hyprlock",
    wallpaper = "hyprpaper",
    statusbar = "waybar",
    grim_slurp = "grim -g \"$(slurp)\" - | wl-copy --",
    grim = "grim - | wl-copy --",

    impala = terminal_open_string(terminal, "impala"),
    bluetui = terminal_open_string(terminal, "bluetui"),
    wiremix = terminal_open_string(terminal, "wiremix"),
    calculator = terminal_open_string(terminal, "numbat"),
    spotify = terminal_open_string(terminal, "spotify_player"),
}

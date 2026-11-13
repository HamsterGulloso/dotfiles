local terminal = "st"
local browser = "helium"

local function terminal_open(terminal, program)
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

    impala = terminal_open(terminal, "impala"),
    bluetui = terminal_open(terminal, "bluetui"),
    wiremix = terminal_open(terminal, "wiremix"),
    calculator = terminal_open(terminal, "numbat"),
    spotify = terminal_open(terminal, "spotify_player"),
}

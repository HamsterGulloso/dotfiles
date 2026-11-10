local terminal = "st"
local browser = "helium"
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
    impala = ("%s -e impala"):format(terminal),
    bluetui = ("%s -e bluetui"):format(terminal),
    wiremix = ("%s -e wiremix"):format(terminal),
    calculator = ("%s numbat"):format(terminal),
}

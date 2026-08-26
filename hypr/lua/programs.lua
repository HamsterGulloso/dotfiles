local terminal = "st"
local browser = "min-browser"
return {
    terminal = terminal,
    fileManager = "dolphin",
    menu = "hyprlauncher",
    browser = browser,
    lock = "hyprlock",
    wallpaper = "hyprpaper",
    statusbar = "waybar",
    impala = ("%s -e impala"):format(terminal),
    bluetui = ("%s -e bluetui"):format(terminal),
    grim_slurp = "grim -g \"$(slurp)\" - | wl-copy --",
    grim = "grim - | wl-copy --",
    calculator = ("%s numbat"):format(terminal),
}

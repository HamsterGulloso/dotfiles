local terminal = "st"
return {
    terminal = terminal,
    fileManager = "dolphin",
    menu = "wofi --show drun",
    browser = "zen",
    browser_private = "zen --private-window",
    lock = "hyprlock",
    wallpaper = "hyprpaper",
    statusbar = "waybar",
    impala = ("%s -e impala"):format(terminal),
    bluetui = ("%s -e bluetui"):format(terminal),
    grim_slurp = "grim -g \"$(slurp)\" - | wl-copy --",
    grim = "grim - | wl-copy --",

    -- statusbar = "~/.config/hypr/scripts/statusbar_toggle.sh",
    -- suspend = "~/.config/hypr/scripts/lock_and_suspend.sh",
}

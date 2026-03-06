status_bar=waybar

if [ -z "$(ps -A | grep $status_bar)" ]; then
    $status_bar
else
    pkill $status_bar
fi

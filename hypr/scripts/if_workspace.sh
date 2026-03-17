activewindow_name=$(hyprctl activewindow -j | jq .workspace.name)
activewindow_layout=$(hyprctl workspaces -j | jq ".[] | select(.name == $activewindow_name) .tiledLayout" -r)
if [ "$activewindow_layout" == "$1" ]; then
    $2
fi

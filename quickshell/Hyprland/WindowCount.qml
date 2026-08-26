import QtQuick
import Quickshell.Hyprland

Text {
  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  text: {
    let ws = Hyprland.focusedWorkspace; 
    if (ws) {
      return `[${ws.toplevels.values.length}]`;
    }
    return "[0]"
  }
}

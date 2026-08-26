import QtQuick
import Quickshell.Hyprland

Row {
  spacing: 10
  
  Repeater {
    model: Hyprland.workspaces
    
    Text {
      text: modelData.name
      color: modelData.active ? "whitesmoke" :  "#777777"
      font {
        family: "Iosevka Nerd Font"
        pixelSize: 11
      }
    }
  }
}

import QtQuick
import Quickshell.Hyprland

Text {
  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : ""
}

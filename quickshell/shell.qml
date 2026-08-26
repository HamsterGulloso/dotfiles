import Quickshell // for PanelWindow
import Quickshell.Io  // for Process
import QtQuick // for Text

import "Hyprland"

PanelWindow {
  visible: false

  Repeater {
    model: Quickshell.screens
    
    PanelWindow {
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 25
      color: "transparent"
      
      // Left
      Row {
        anchors {
          left: parent.left
          leftMargin: 15
          verticalCenter: parent.verticalCenter
        }
        spacing: 10

        WindowCount {}
        Workspaces {}
        WindowTitle {}
      }

      // Center
      Row {
        anchors {
          centerIn: parent
          verticalCenter: parent.verticalCenter
        }
        spacing: 10

        Clock {}
      }

      // Right
      Row {
        anchors {
          right: parent.right
          rightMargin: 15
          verticalCenter: parent.verticalCenter
        }
        spacing: 10

        Network {}
        // Bluetooth {}
        CPU {}
        Memory {}
      }

    }
  }
}

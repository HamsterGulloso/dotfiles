import QtQuick
import Quickshell.Io  // for Process

Text {
  id: network
  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  Process {
    id: networkProcess
    running: true
    command: ["sh", "-c", `
      # Check if connected
      ip -br addr show | grep "UP" >/dev/null && echo "\udb80\udf18"
    `]


    stdout: StdioCollector {
      onStreamFinished: network.text = this.text
    }
  }

  Timer {
    running: true
    interval: 1000
    repeat: true
    onTriggered: network.Process.running = true
  }
}

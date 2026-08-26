import QtQuick
import Quickshell.Io  // for Process

Text {
  id: clock

  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  Process {
    id: clockProcess
    running: true
    command: ["date", "+%H:%M | %A, %d/%m"]

    stdout: StdioCollector {
      onStreamFinished: clock.text = this.text
    }
  }

  Timer {
    running: true
    interval: 1000
    repeat: true
    onTriggered: clock.Process.running = true
  }
}

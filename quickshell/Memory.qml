import QtQuick
import Quickshell.Io  // for Process

Text {
  id: memory
  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  Process {
    id: memoryProcess
    running: true
    command: ["sh", "-c", "free | grep Mem | awk '{ printf(\"%.0f% \", $3/$2 * 100.0) }'"]

    stdout: StdioCollector {
      onStreamFinished: memory.text = this.text
    }
  }

  Timer {
    running: true
    interval: 1000
    repeat: true
    onTriggered: memory.Process.running = true
  }
}

import QtQuick
import Quickshell.Io  // for Process

Text {
  id: cpu
  color: "whitesmoke"
  font {
    family: "Iosevka Nerd Font"
    pixelSize: 11
  }

  Process {
    id: cpuProcess
    running: true
    command: ["sh", "-c", "top -bn1 | grep 'CPU(s)' | awk '{printf(\"%.0f%% \", 100 - $8)}'"]

    stdout: StdioCollector {
      onStreamFinished: cpu.text = this.text
    }
  }

  Timer {
    running: true
    interval: 1000
    repeat: true
    onTriggered: cpu.Process.running = true
  }
}

import QtQuick
import Quickshell

// Potato mode follows the plugin's own enabled state: the helper's `sync`
// installs the Hyprland profile while the plugin is enabled and removes it
// once `omarchy plugin disable` has run. Syncing on destruction too means a
// shell restart keeps the profile, while a disable drops it.
Item {
  readonly property string helperPath: Qt.resolvedUrl("potato-mode").toString().replace(/^file:\/\//, "")

  Component.onCompleted: Quickshell.execDetached([helperPath, "sync"])
  Component.onDestruction: Quickshell.execDetached([helperPath, "sync"])
}

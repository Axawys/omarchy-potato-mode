# Potato Mode for Omarchy

An Omarchy shell plugin that makes Hyprland light enough for weak hardware.
While the plugin is enabled, Hyprland behaves like a flat, sway-like
compositor:

- no animations
- no blur and no shadows
- no rounded corners
- no dimming of inactive windows
- no window transparency (Omarchy's default 0.985/0.96 opacity is dropped,
  so the compositor stops blending every window with what is behind it)
- no gradients on group bars

There is no bar icon and nothing to configure: enabling the plugin turns
potato mode on, disabling it brings the effects back.

## Install

```bash
omarchy plugin add https://github.com/Axawys/omarchy-potato-mode --enable
```

## Usage

```bash
omarchy plugin disable io.github.axawys.potato-mode   # effects back
omarchy plugin enable io.github.axawys.potato-mode    # potato mode again
```

The setting survives Hyprland reloads, shell restarts and reboots.

## How it works

Omarchy loads every Lua file in `~/.local/state/omarchy/toggles/hypr/` after
your own Hyprland config on each reload. That is the mechanism behind
Omarchy's built-in toggles such as window gaps.

The plugin is a headless `service`. When it loads and when it unloads, it runs
`potato-mode sync`, which checks whether the plugin is enabled and then copies
`potato.lua` to `~/.local/state/omarchy/toggles/hypr/potato-mode.lua` or
deletes that file, followed by `hyprctl reload`. A shell restart leaves the
mode as it was, and only a real disable removes it.

Your files in `~/.config/hypr/` are never touched. To change what potato mode
disables, edit `potato.lua` in the plugin directory and toggle the plugin off
and on.

The helper also works by hand:

```bash
~/.config/omarchy/plugins/io.github.axawys.potato-mode/potato-mode status
```

## Remove

```bash
omarchy plugin remove io.github.axawys.potato-mode
```

Removing the plugin disables it first, which deletes the Hyprland profile. The
profile also checks that the plugin is still installed and does nothing if it
is not, so a leftover file can never keep effects off. To clean up by hand:

```bash
rm -f ~/.local/state/omarchy/toggles/hypr/potato-mode.lua
hyprctl reload
```

## Requirements

An Omarchy release with the Lua Hyprland config and the Quickshell-based
Omarchy shell. It uses `jq` and `hyprctl`, both part of a standard Omarchy
install. No other dependencies.

## License

MIT

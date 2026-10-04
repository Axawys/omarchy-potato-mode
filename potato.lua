-- Potato mode: strip Hyprland down to a sway-like flat compositor.
-- Installed by the io.github.axawys.potato-mode plugin into
-- ~/.local/state/omarchy/toggles/hypr/, which Omarchy loads after the user
-- config on every reload, so these values win over themes and looknfeel.lua.

-- If the plugin was removed without cleaning up, do nothing.
local manifest = io.open(os.getenv("HOME") .. "/.config/omarchy/plugins/io.github.axawys.potato-mode/manifest.json")
if not manifest then return end
manifest:close()

hl.config({
  animations = {
    enabled = false,
  },

  decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    fullscreen_opacity = 1.0,
    dim_inactive = false,
    dim_special = 0,

    blur = {
      enabled = false,
    },

    shadow = {
      enabled = false,
    },
  },

  group = {
    groupbar = {
      gradients = false,
    },
  },
})

-- Translucent windows force blending of everything behind them; make every
-- window fully opaque, including apps with their own opacity rules.
o.window(".*", { tag = "-default-opacity", opacity = "1 1" })

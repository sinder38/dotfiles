-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "nautilus"
local editor      = "zeditor"
local browser     = "brave"

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("F11", hl.dsp.window.fullscreen())

-- hyprexpo workspace overview, see plugins.lua
hl.bind(mainMod .. " + W", function() hl.plugin.hyprexpo.expo("toggle") end)

-- hl.bind("SUPER + B", hl.dsp.global("quickshell:sidebarLeftToggle"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

-- caelestia-shell globals (launcher, session menu, lock, sidebar/notif center)
-- see https://github.com/caelestia-dots/shell#shortcutsipc
hl.bind(mainMod .. " + A", hl.dsp.global("caelestia:launcher"))
hl.bind(mainMod .. " + M", hl.dsp.global("caelestia:session"))
hl.bind(mainMod .. " + L", hl.dsp.global("caelestia:lock"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.global("caelestia:sidebar"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.global("caelestia:clearNotifs"), { locked = true })
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.global("caelestia:showall"))

-- Clipboard history and emoji picker (caelestia-cli, backed by cliphist/fuzzel)
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Dvorak navigation
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + N", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + T", hl.dsp.focus({ direction = "down" }))

-- Dvorak resize
-- hl.bind("SUPER + Minus", hl.dsp.window.resize(fn.resize_active_window(-10, 0)), { repeating = true })
-- hl.bind("SUPER + Equal", hl.dsp.window.resize(fn.resize_active_window(10, 0)), { repeating = true })
-- hl.bind("SUPER + SHIFT + Minus", hl.dsp.window.resize(fn.resize_active_window(0, -10)), { repeating = true })
-- hl.bind("SUPER + SHIFT + Equal", hl.dsp.window.resize(fn.resize_active_window(0, 10)), { repeating = true })
-- hl.bind("SUPER + ALT + left", hl.dsp.window.resize(fn.resize_active_window(-10, 0)), { repeating = true })
-- hl.bind("SUPER + ALT + right", hl.dsp.window.resize(fn.resize_active_window(10, 0)), { repeating = true })
-- hl.bind("SUPER + ALT + up", hl.dsp.window.resize(fn.resize_active_window(0, -10)), { repeating = true })
-- hl.bind("SUPER + ALT + down", hl.dsp.window.resize(fn.resize_active_window(0, 10)), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

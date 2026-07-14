-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- caelestia-shell provides the bar, launcher, lock screen, session menu and
-- notification center, so it's the only thing we need to autostart here.
hl.on("hyprland.start", function()
    -- Load plugins
    hl.exec_cmd("hyprpm reload")
    -- Signal prefer-dark to all XDG portal-aware apps (Brave, Electron, etc.)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
    hl.exec_cmd("caelestia shell -d")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Live Wallpaper,
    -- TODO: this is hardcoded from dot_local/bin/executable_wallpaper
    -- mpv paper seems to leek memory and is problematic
    -- hl.exec_cmd("mpvpaper -o \"no-audio loop vf=lavfi=[scale=3200:1800,crop=2880:1800:160:0]\" \"*\" \"/home/sinder/.local/share/wallpapers/wallpaper.mp4\"")

    -- Steam (and any other XWayland app that reads Xft.dpi
    -- 144 = 96 * 1.5 for 1.5x UI scaling
    hl.exec_cmd("sh -c 'echo \"Xft.dpi: 144\" | xrdb -merge -'")
end)

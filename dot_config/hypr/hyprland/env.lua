-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- XWayland apps (Steam, etc.) don't support fractional scaling; render them at
-- 1x and let each app scale itself to avoid the blurry/JPEG upscale artifact.
-- hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "2")

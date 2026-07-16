## Workflow remider 

| Task | Command |
|---|---|
| Apply source → home | `chezmoi apply` |
| See what has drifted | `chezmoi diff` |
| Pull a live edit back into source | `chezmoi re-add ~/.config/zed/settings.json` |


## TODO:

1. Some software like (Zed, KDE) auto-save settings. chezmoi won't know! Run `chezmoi re-add <file>` to sync

## Bootstrap on a new machine

```bash
# install chezmoin somehow
chezmoi init --apply https://github.com/sinder38/dotfiles
```

chezmoi will create `~/.config/chezmoi/chezmoi.toml` for machine-specific config (never committed).

## Dev server remider 

The Hetzner dev server is separate

The playbook currently does **not** apply these dotfiles. 
To integrate chezmoi into the server bootstrap, add a role that:

1. Installs chezmoi (`sh -c "$(curl -fsLS get.chezmoi.io)"`)
2. Runs `chezmoi init --apply git@github.com:sinder38/dotfiles.git`
3. Uses a `.chezmoiignore` to skip laptop-only configs (ghostty, kitty, wezterm, KDE, etc.)

See the [chezmoi docs on `.chezmoiignore`](https://chezmoi.io/reference/special-files/chezmoiignore/) for templating by machine type


## Animated wallpaper

Use the `wallpaper` script to set a video wallpaper:

```bash
wallpaper ~/path/to/file.mp4
```

Copies to `~/.local/share/wallpapers/wallpaper.mp4` and sets it via mpvpaper (hardware-accelerated, plays MP4 directly).

## Required secrets (password-store)

Run `pass insert` for each before applying chezmoi:

| pass path                  | what it is                        |
|----------------------------|-----------------------------------|
| email/gmail/address       | Gmail address                     |
| email/gmail/app-password   | Gmail App Password                |
| email/gmail/smtp-url   | smtps://<username>@smtp.gmail.com                |
| realname   | My IRL name                |


## Dvorak remaps

Instead of learning qwerty vim-like keybinds I rebind them to use my own which are more ergonomic for my dvorak layout:  
Here is an example from NeoVim

```lua
-- Dvorak movement
vim.keymap.set("", "t", "j", remap_opts)
vim.keymap.set("", "n", "k", remap_opts)
vim.keymap.set("", "s", "l", remap_opts)

-- insert swap
vim.keymap.set("n", "a", "i", remap_opts)
vim.keymap.set("n", "i", "a", remap_opts)
vim.keymap.set("n", "I", "A", remap_opts)
vim.keymap.set("n", "A", "I", remap_opts)
```

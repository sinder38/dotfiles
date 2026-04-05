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
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:sinder38/dotfiles.git
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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end


fish_vi_key_bindings
function fish_user_key_bindings
    # Dworak rebind
    bind -s --preset -M default h backward-char
    bind -s --preset -M default s forward-char
    bind -s --preset -m insert a repaint-mode
    bind -s --preset -m insert A beginning-of-line repaint-mode

    bind -s --preset -m insert i 'set fish_cursor_end_mode exclusive' forward-single-char repaint-mode
    bind -s --preset -m insert I 'set fish_cursor_end_mode exclusive' end-of-line repaint-mode

    bind -s --preset -m visual V begin-selection repaint-mode

    bind -s --preset n up-or-search
    bind -s --preset t down-or-search

    bind -s --preset d,i backward-jump-till and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection
    bind -s --preset d,a backward-jump and repeat-jump-reverse and begin-selection repeat-jump kill-selection end-selection
end

# TODO: this is the dvorak keymap
# keymap.set("", "t", "j", remap_opts)
# keymap.set("", "n", "k", remap_opts)
# keymap.set("", "s", "l", remap_opts)
# keymap.set("n", "a", "i", remap_opts)
# keymap.set("n", "i", "a", remap_opts)
# keymap.set("n", "I", "A", remap_opts)
# keymap.set("n", "A", "I", remap_opts)

fish_vi_key_bindings
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /home/sinder/anaconda3/bin/conda
#     eval /home/sinder/anaconda3/bin/conda "shell.fish" hook $argv | source
# else
#     if test -f "/home/sinder/anaconda3/etc/fish/conf.d/conda.fish"
#         . "/home/sinder/anaconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH /home/sinder/anaconda3/bin $PATH
#     end
# end
# <<< conda initialize <<<

# TODO: path and aliases are kinda slow to source. optimize later.
function ssource --description "source most of my dotfiles, useful if making changes and iterating"

    source ~/.config/fish/path.fish
    source ~/.config/fish/aliases.fish
    source ~/.config/fish/functions.fish

    # pull in all shared `export \u2026` aka `set -gx \u2026`
    # source ~/.exports

    # if test -e "../private/extras.fish"
    #     source ../private/extras.fish
    # end

    # for things not checked into git..
    # if test -e "$HOME/.extra.fish"
    #     source ~/.extra.fish
    # end
end

ssource

# I don't need a prompt symbol for you-got-things-in-yr-stash
set --erase pure_symbol_git_stash

# Readline colors
# set -g fish_color_autosuggestion 555 yellow
# set -g fish_color_command 5f87d7
# set -g fish_color_comment 808080
# set -g fish_color_cwd 87af5f
# set -g fish_color_cwd_root 5f0000
# set -g fish_color_error 870000 --bold
# set -g fish_color_escape af5f5f
# set -g fish_color_history_current 87afd7
# set -g fish_color_host 5f87af
# set -g fish_color_match d7d7d7 --background=303030
# set -g fish_color_normal normal
# set -g fish_color_operator d7d7d7
# set -g fish_color_param 5f87af
# set -g fish_color_quote d7af5f
# set -g fish_color_redirection normal
# set -g fish_color_search_match --background=purple
# set -g fish_color_status 5f0000
# set -g fish_color_user 5f875f
# set -g fish_color_valid_path --underline
#
# set -g fish_color_dimmed 555
# set -g fish_color_separator 999

# Git prompt status
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showupstream auto
set -g pure_git_untracked_dirty false

# pure
set pure_threshold_command_duration 1
set pure_separate_prompt_on_error true
set pure_begin_prompt_with_current_directory false
set -U pure_color_success (set_color green)
set -U pure_color_git_dirty (set_color cyan)

set -U pure_color_git_unpushed_commits (set_color yellow)
set -U pure_color_git_unpulled_commits (set_color brgreen)

# prompt (lucid)

set -g lucid_prompt_symbol_error_color red

# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate red

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

# Local prompt customization
set -e fish_greeting

set -g fish_pager_color_completion normal
set -g fish_pager_color_description 555 yellow
set -g fish_pager_color_prefix cyan
set -g fish_pager_color_progress cyan

# sam
set -x SAM_CLI_TELEMETRY 0

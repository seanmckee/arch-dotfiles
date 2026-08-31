# Sean's Keyboard-First Linux Guide

This setup is Arch Linux, Hyprland, Kitty, Zsh, tmux, Neovim, Fuzzel, and
keyboard-driven utilities. Almost everything begins with `Super` (the Windows
key) or tmux's `Ctrl+A` prefix.

## Reading this guide

- Open it anywhere with `Super+F1` or the `riceguide` terminal command.
- Move with `j`/`k`, arrows, Page Up/Page Down, `g`/`G`, or the mouse wheel.
- Search with `/`, type a phrase, then press Enter. Use `n`/`N` for matches.
- Press `q` to close it.

## Hyprland essentials

| Keys | Action |
|---|---|
| `Super+Q` | Open Kitty terminal |
| `Super+R` | Open the Fuzzel application launcher |
| `Super+E` | Open Dolphin file manager |
| `Super+C` | Close the focused window |
| `Super+V` | Toggle floating for the focused window |
| `Super+P` | Toggle pseudotiling |
| `Super+T` | Toggle the Dwindle split direction |
| `Super+M` | Open the lock/logout/power menu |
| `Super+F1` | Open this guide |

### Windows and workspaces

| Keys | Action |
|---|---|
| `Super+H/J/K/L` | Focus left/down/up/right |
| `Super+Shift+H/J/K/L` | Move the window left/down/up/right |
| `Super+1` … `Super+0` | Go to workspace 1 … 10 |
| `Super+Shift+1` … `Super+Shift+0` | Move window to workspace 1 … 10 |
| `Super+S` | Toggle the `magic` scratch workspace |
| `Super+Shift+S` | Move window to the scratch workspace |

### Modal commands

`Super+Shift+R` enters resize mode:

| Key in mode | Action |
|---|---|
| `h/j/k/l` or arrows | Resize left/down/up/right |
| `Enter` or `Escape` | Leave resize mode |

`Super+O` enters open mode. Press one key afterward:

| Key in mode | Opens |
|---|---|
| `d` | Project selector and persistent tmux session |
| `f` | Yazi terminal file manager |
| `g` | lazygit |
| `a` | wiremix audio mixer |
| `b` | btop system monitor |
| `h` | Atuin command history |
| `n` | Most recently dismissed notification |
| `t` | Desktop theme selector |
| `Escape` | Cancel |

## Daily utilities

| Keys | Action |
|---|---|
| `Super+D` | Select or resume a development project |
| `Super+Shift+V` | Search clipboard history; Enter copies selection |
| `Super+B` | Hide/show Waybar |
| `Super+Shift+B` | Reload Waybar configuration and style |
| `Super+Shift+T` | Select a system-wide color theme |
| `Print` | Select a region and copy the screenshot |
| `Shift+Print` | Copy a full-screen screenshot |
| `Super+Print` | Select and annotate a screenshot in Swappy |
| `Ctrl+Print` | Save a selected region to `~/Pictures/Screenshots` |
| `Ctrl+Shift+Print` | Save the full screen |

Volume, mute, microphone, media, and brightness keys work normally and use
SwayOSD for visual feedback when it is installed.

## Development projects

Press `Super+D`, select a directory with `fzf`, and press Enter. The selector
combines:

1. Git repositories found under `~/dev`.
2. Directories remembered by zoxide.

You can also launch a specific directory:

```bash
devsession ~/dev/my-project
```

Each project gets a persistent tmux session named after its directory. It starts
windows for Neovim, a shell, lazygit, Claude (when installed), and development
servers. A project-defined `mise run dev` task is preferred; otherwise root,
`frontend`, and `backend` npm `dev` scripts are detected.

Close Kitty without losing the session. Reopen it with `Super+D`. To deliberately
destroy one, run `devclose` and select it. Sessions survive terminal closure but
not a reboot.

## tmux

tmux calls its tabs **windows**. Its command prefix is `Ctrl+A`: press and
release `Ctrl+A`, then press the next key.

### Windows

| After `Ctrl+A` | Action |
|---|---|
| `n` / `p` | Next / previous window |
| `1` … `9` | Jump to numbered window |
| `w` | Browse all sessions and windows |
| `l` | Return to the previously used window |
| `c` | Create a window in the current directory |
| `,` | Rename the current window |
| `&` | Close the current window (asks first) |
| `d` | Detach without stopping the project |

Typical project windows are `editor`, `shell`, `git`, `agent`, and one or more
development-server windows.

### Panes and copy mode

| After `Ctrl+A` | Action |
|---|---|
| `\|` | Split left/right |
| `-` | Split top/bottom |
| `h/j/k/l` | Focus a pane |
| `H/J/K/L` | Resize a pane |
| `[` | Enter vi-style copy/scroll mode |
| `Space` | Begin selection in copy mode |
| `Enter` | Copy selection and leave copy mode |
| `r` | Reload `~/.tmux.conf` |

## Terminal and shell

| Command/key | Action |
|---|---|
| `Ctrl+R` | Search contextual command history with Atuin |
| `j/k` | Move through Atuin results in normal mode |
| `i` | Enter Atuin insert/search mode |
| `Tab` | Put an Atuin result on the command line for editing |
| `z name` | Jump to a frequently used directory with zoxide |
| `zi` | Interactively select a zoxide directory |
| `y` | Open Yazi; exiting changes the shell to Yazi's directory |
| `lg` | Not configured; use `lazygit` directly |
| `theme` | Select a color theme |
| `theme set NAME` | Apply a named theme directly |
| `theme list` | List available themes |
| `theme nvim on` | Match Neovim to the active desktop palette after restart |
| `theme nvim off` | Restore Neovim's Tokyo Night Storm theme after restart |
| `riceguide` | Open this guide |

Useful modern replacements installed here include `rg` (grep), `fd` (find),
`bat` (cat), `eza` (ls), `btop` (top), and `jq` (JSON processing).

## Yazi

| Key | Action |
|---|---|
| `h/j/k/l` | Parent/down/up/open directory |
| `Enter` | Open selected item |
| `q` | Quit |
| `Q` | Quit without changing shell directory |
| `Space` | Select an item |
| `y` / `x` / `p` | Copy / cut / paste |
| `a` | Create a file; end the name with `/` for a directory |
| `r` | Rename |
| `d` | Move to trash |
| `.` | Toggle hidden files |
| `/` | Find interactively |
| `f` | Filter the current directory |
| `~` or `F1` | Show Yazi's complete key help |

## Neovim / LazyVim survival keys

| Key | Action |
|---|---|
| `Space` | Open the LazyVim command menu |
| `Space+f+f` | Find files |
| `Space+f+g` | Search project text |
| `Space+e` | Toggle file explorer |
| `Space+b+d` | Delete current buffer |
| `]b` / `[b` | Next / previous buffer |
| `gd` / `gr` | Go to definition / references |
| `K` | Show documentation |
| `Space+c+a` | Code action |
| `Space+c+r` | Rename symbol |
| `Space+x+x` | Diagnostics list |
| `:w` / `:q` / `:wq` | Save / quit / save and quit |

Press `Space`, pause, and read the WhichKey menu when unsure.

## Brave with Vimium C

These are Vimium C defaults and may differ if the extension is customized.

| Key | Action |
|---|---|
| `f` / `F` | Follow link here / in a new tab |
| `j/k` | Scroll down/up |
| `d/u` | Half-page down/up |
| `gg` / `G` | Top/bottom of page |
| `H/L` | Back/forward in browser history |
| `o` / `O` | Open URL/bookmark here / new tab |
| `b` / `B` | Open bookmark here / new tab |
| `t` | New tab |
| `x` / `X` | Close tab / restore closed tab |
| `J/K` | Previous/next browser tab |
| `r` | Reload page |
| `gi` | Focus the first text input |
| `v` / `V` | Visual / visual-line selection |
| `?` | Show Vimium C's own help |

Use `Ctrl+L` when you need the browser address bar directly.

## Themes and configuration

The `theme` command updates Hyprland, Waybar, Kitty, Fuzzel, Mako, btop,
lazygit, tmux, and the wallpaper. Neovim follows the same palette when
`theme nvim on` is enabled; use `theme nvim off` to restore Tokyo Night Storm.
Configuration lives in `~/dotfiles` and is linked into the home directory with
GNU Stow.

Important locations:

| Path | Purpose |
|---|---|
| `~/dotfiles/hypr/.config/hypr/hyprland.lua` | Hyprland behavior and bindings |
| `~/dotfiles/tmux/.tmux.conf` | Generated tmux configuration |
| `~/dotfiles/zsh/.zshrc` | Shell initialization |
| `~/dotfiles/themes/` | Palettes and generated-config templates |
| `~/dotfiles/bin/.local/bin/` | Personal commands |
| `~/dotfiles/GUIDE.md` | This guide |

Edit files under `~/dotfiles`, not the symlinks under `~/.config`. The Hyprland
configuration uses Lua rather than legacy `hyprland.conf` syntax.

## If something gets stuck

- Leave a Hyprland mode with `Escape`.
- Leave tmux copy mode with `q` or `Escape`.
- Detach from tmux with `Ctrl+A`, then `d`.
- Reload tmux with `Ctrl+A`, then `r`.
- Reload Hyprland with `hyprctl reload`.
- Reload Waybar with `Super+Shift+B`.
- Open this guide with `Super+F1`.

# Sean's Arch + Hyprland dotfiles

Reference for AI assistants working on this config. Read this before exploring —
it captures the non-obvious things that are expensive to rediscover.

## Layout: GNU stow + git

Everything lives in `~/dotfiles` (git repo, remote `github.com/seanmckee/arch-dotfiles`)
and is **stowed** into the home directory as symlinks. Packages include `atuin bin btop
fuzzel hypr kitty lazygit mako nvim starship tmux waybar yazi zsh`.

```
~/.config/waybar  ->  ~/dotfiles/waybar/.config/waybar
~/.config/hypr    ->  ~/dotfiles/hypr/.config/hypr        (etc.)
```

**Edit files under `~/dotfiles/`, not `~/.config/`.** Both work (symlinks), but
`~/dotfiles` is the git-tracked truth. No re-stow needed after edits — symlinks are live.
`~/.config` itself is NOT a git repo.

## ⚠️ Hyprland uses the LUA config format

There is **no `hyprland.conf`**. The only active config is `hypr/.config/hypr/hyprland.lua`
(Hyprland 0.56.2). Classic hyprlang syntax will not work.

| hyprlang | Lua equivalent |
|---|---|
| `bind = SUPER, Q, exec, kitty` | `hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))` |
| `exec-once = waybar` | inside `hl.on("hyprland.start", function() hl.exec_cmd("waybar") end)` |
| `env = X,1` | `hl.env("X", "1")` |
| `windowrule = float, class:foo` | `hl.window_rule({ match = { class = "foo" }, float = true })` |
| `general { gaps_in = 5 }` | `hl.config({ general = { gaps_in = 5 } })` |

Verified-working window_rule keys: `float`, `size = "900 600"`, `center = true`,
`workspace`, `move`, `suppress_event`, `no_focus`, `name`.

File uses **tabs** for indentation. Apply config with `hyprctl reload` (no logout).
Lua binds show as `dispatcher: __lua` in `hyprctl binds`, so you cannot grep that
output for the command text — count binds instead to confirm registration.

## Theming: multi-theme switcher

**Do not hand-edit themed configs — they are GENERATED.** Edit the template instead
and re-run `theme set <name>`, or your change is lost on the next switch.

```
themes/palettes/<name>.conf   # colour definitions (KEY=value)
themes/templates/*            # config templates using @@key@@ placeholders
bin/.local/bin/theme          # the switcher script (python3, no deps)
```

| command | |
|---|---|
| `theme` | fuzzel picker (also **SUPER+SHIFT+T**) |
| `theme list` / `theme current` | |
| `theme set matrix` | apply by name |

Themes (11): `tokyo-night` (default), `catppuccin-mocha`, `gruvbox`, `rose-pine`,
`kanagawa`, `everforest`, `nord`, `dracula`, `synthwave`, `matrix`, `samurai`.
**Adding a theme = one palette file**, no code changes.

Wallpapers for the non-stock themes are generated with ffmpeg radial gradients into
`~/Pictures/wallpapers/generated/`. Swap in real images by editing the palette's
`wallpaper=` line.

### Generated files (never edit directly)

| template | generated to |
|---|---|
| `waybar.css` | `waybar/.config/waybar/style.css` |
| `fuzzel.ini` | `fuzzel/.config/fuzzel/fuzzel.ini` |
| `mako.config` | `mako/.config/mako/config` |
| `kitty-colors.conf` | `kitty/.config/kitty/current-theme.conf` |
| `hypr-colors.lua` | `hypr/.config/hypr/colors.lua` (loaded via `pcall(require, "colors")`) |
| `btop.theme` | `btop/.config/btop/themes/current.theme` |
| `lazygit.yml` | `lazygit/.config/lazygit/config.yml` |
| `tmux.conf` | `tmux/.tmux.conf` |

Palette keys are semantic (`bg fg dim muted accent accent2 sel red green yellow blue
magenta cyan border_active1/2 border_inactive wallpaper`). The script derives
`<key>_hex` (no `#`) and `<key>_r/_g/_b` (decimal) automatically.

**Gotchas learned the hard way:**
- Placeholders use `@@key@@`, NOT `$key` or `{key}` — starship.toml uses `$vars` and
  CSS uses `{}` braces, so both would collide.
- **GTK3 (waybar) cannot parse 8-digit hex `#RRGGBBAA`** — it fails with a misleading
  "Missing semicolon at end of color definition" and waybar exits. Always emit
  `rgba(r, g, b, a)` for translucency in waybar CSS.
- `mako` has `max-icon-size`, **not** `icon-size` — an invalid key makes the whole
  config fail to parse.
- **`hyprctl keyword` does NOT work with the Lua config** ("keyword can't work with
  non-legacy parsers"). The theme script calls `hyprctl reload` instead, which re-reads
  the generated `colors.lua`.
- **`pcall(require, "colors")` must come AFTER the `general{}` block** in hyprland.lua.
  Placed before it, the hardcoded `col.active_border` silently overrides the theme.
- In zsh, `"$1:c1=..."` applies `:c` as a parameter-expansion modifier — use `${1}`
  braces when building ffmpeg filter strings.

### Live reload on switch

waybar (`SIGUSR2`), mako (`makoctl reload`), hyprland borders (`hyprctl keyword`),
wallpaper (`hyprctl hyprpaper`), and **running kitty windows** via `kitty @ set-colors`
(needs `listen_on unix:/tmp/kitty-{kitty_pid}` in kitty.conf — already set; only kitty
processes started *after* that line was added expose a socket).

btop / lazygit / fuzzel apply on next launch. **nvim is deliberately NOT wired in** —
LazyVim colorscheme switching across running instances isn't clean, and matrix/samurai
have no true nvim equivalent. It stays on tokyonight-storm.

## Palette: Tokyo Night Storm (the default theme)

Deliberately unified across kitty, nvim, hyprlock and waybar. **Match it for anything new.**

| | |
|---|---|
| bg / bg_dark | `#24283b` / `#1d202f` |
| fg / dim / muted | `#c0caf5` / `#a9b1d6` / `#565f89` |
| red / green / yellow | `#f7768e` / `#9ece6a` / `#e0af68` |
| blue / magenta / cyan | `#7aa2f7` / `#bb9af7` / `#7dcfff` |
| orange (accent) | `#ff9e64` |

Source of truth: `kitty/.config/kitty/current-theme.conf`.
nvim uses `folke/tokyonight.nvim` style `storm`, transparent.

**Exception:** Hyprland's own borders are still the stock cyan→green gradient
(`rgba(33ccffee)` → `rgba(00ff99ee)`), deliberately left unthemed. Blue→magenta
(`#7aa2f7` → `#bb9af7`) would match if ever asked.

Font: **JetBrainsMono Nerd Font** (`ttf-jetbrains-mono-nerd`), used by kitty and waybar.

## Waybar

`waybar/.config/waybar/{config.jsonc,style.css}` — two files, **no custom scripts,
no `exec` anywhere.** All modules native and event-driven. Waybar 0.15.0.

Design: three **floating islands** (transparent bar, `margin-top: 6`, side margins 12,
islands at `border-radius: 10px` matching Hyprland's `decoration:rounding`).

- left `hyprland/workspaces` · center `hyprland/window` · right `cpu memory network bluetooth pulseaudio battery clock tray`
- Workspaces: `persistent-workspaces {"*": 5}` (floor of 5, more on demand) with
  `window-rewrite` icons derived from window class/title. Active = filled orange pill.
- Info density principle: **icon on the bar, detail in the tooltip.**
- `pulseaudio` is used rather than `wireplumber` specifically because it has
  `format-bluetooth` (shows when audio routes to BT headphones).
- Click escape hatches open TUIs in a floating `--class waybar-popup` kitty window
  (btop / nmtui / wiremix), sized by a `waybar-popup` rule in hyprland.lua.

### Reloading waybar

```bash
pkill -SIGUSR2 waybar      # reload config + CSS in place  (SUPER+SHIFT+B)
pkill -SIGUSR1 waybar      # toggle visibility             (SUPER+B)
```

**After installing a font you must fully restart waybar, not SIGUSR2** — GTK caches
fontconfig at startup, so a reload keeps rendering tofu. `hyprctl dispatch exec waybar`
is unreliable here; use `setsid nohup waybar >/dev/null 2>&1 & disown`.

Validate before reloading: `python3 -m json.tool ~/.config/waybar/config.jsonc >/dev/null`

Glyphs are Nerd Font PUA codepoints. **Write them as `\Uxxxxxxxx` escapes via Python,
not literal characters** — literals get mangled in transit. Preview candidates with:
`pango-view --font="JetBrainsMono Nerd Font 22" -q -o out.png file.txt`
(several plausible codepoints render as something entirely different — `F04D5` is a
play-triangle, not a speedometer.)

## Keybinds (mainMod = SUPER)

`Q` kitty · `R` fuzzel · `E` dolphin · `C` close · `V` float · `P` pseudo · `T` togglesplit
`H/J/K/L` focus (vim) · `+SHIFT` swap · `1..0` workspace · `+SHIFT` move window
`S` special workspace "magic" · `B` toggle waybar · `SHIFT+B` reload waybar
`SHIFT+T` theme picker · `D` persistent project session · `SHIFT+V` clipboard history
`SHIFT+R` resize mode · `O` one-shot TUI/open mode · `M` power menu · `F1` usage guide
`Print` region to clipboard · `SUPER+Print` annotate with swappy

Media/laptop keys: volume via `wpctl`, brightness via `brightnessctl`, media via `playerctl`.

**The user is strongly keyboard-first.** Don't add bar buttons or GUI launchers that
duplicate an existing keybind. Prefers TUI over GUI utilities (btop, lazygit, nmtui,
wiremix, spotatui). Explicitly does not want a dock, or a cluttered Windows/GNOME-like bar.

## Dev session workflow

`~/.local/bin/devsession [dir]` fuzzy-selects a Git/zoxide directory and attaches to a
persistent `dev-<project>` tmux session in a `dev-session` Kitty window. New sessions
contain editor, shell and git windows, plus a `dev` window when the project exposes a
`mise run dev` task. `~/.local/bin/devclose` fuzzy-selects a session to destroy.

## Daemons & services

| | |
|---|---|
| Notifications | **mako**, systemd user unit, **no config file at all** (pure defaults) |
| Bluetooth | bluez + **blueman-applet** — this is the **pairing/auth agent**, not just a tray icon. Do not disable it. |
| Network | NetworkManager. `nm-applet` was removed from autostart (waybar's network module replaces it) |
| Audio | PipeWire + wireplumber + pipewire-pulse. `wpctl` for CLI, `wiremix` TUI mixer |
| Hyprland | hyprpaper, hypridle, hyprlock. No polkit agent installed |
| Clipboard | cliphist; text and image watchers start with Hyprland; `SUPER+SHIFT+V` picker |
| OSD / color | SwayOSD for media keys; hyprsunset switches to a warm evening profile |

Autostart lives in `hl.on("hyprland.start", ...)` in hyprland.lua.

## Hardware

Lenovo **ThinkPad T14s Gen 3**. Battery `BAT0`. **Wi-Fi only** — `wlp0s20f3`, no
ethernet interface exists. Internal display `eDP-1` @ 2240x1400, scale 1.4583.
Laptop, so prefer event-driven modules over polling.

## Known pre-existing issues (unfixed, flagged)

1. **`monitors.lua` is orphaned** — nothing `require`s it, so the nwg-displays
   three-monitor layout is NOT applied. `eDP-1` sits at `0x0`, not its configured
   `3840x120`. `monitors.conf` and `workspaces.conf` (0 bytes) are also dead files.
2. `hyprpaper.conf` sets a wallpaper only for `eDP-1` and has no `preload` line.
3. `local menu = "hyprlauncher"` in hyprland.lua is dead code (not installed; fuzzel is used).

## Working style

Small reviewable diffs, show the diff after each logical change, explain how to reload
without logging out. Back up before editing (`~/dotfiles` is a git repo — but check
`git status` first; there is often uncommitted WIP that `git checkout --` would destroy).
Prefer native modules over scripts, avoid polling on battery, and justify any new package.

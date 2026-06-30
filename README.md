# Arch Linux Dotfiles

Personal dotfiles for an Arch Linux desktop built around
[Hyprland](https://hypr.land/). The Hyprland configuration uses the Lua format
introduced in Hyprland 0.55 and is split into small modules.

> [!WARNING]
> These files reflect my hardware, applications, and workflow. Review the
> machine-specific settings before using them. Do not replace your current
> configuration without a backup.

## Included configurations

| Directory | Description |
| --- | --- |
| `hypr/` | Modular Hyprland Lua configuration |
| `waybar/` | Horizontal and vertical Waybar layouts |
| `kitty/` | Kitty terminal settings |
| `mako/` | Notification daemon settings |
| `nvim/` | LazyVim-based Neovim configuration |

The active Hyprland entry point is `hypr/hyprland.lua`. The old Hyprlang
configuration is retained as `hypr/hyprland.conf.bak` for reference.


## Requirements

The main components are:

- Hyprland 0.55 or newer
- Waybar
- Kitty
- Mako
- Neovim
- PipeWire and WirePlumber
- JetBrains Mono Nerd Font and Noto Sans CJK JP

Several bindings and modules also use `brightnessctl`, `playerctl`, `grim`,
`slurp`, `pavucontrol`, `fastfetch`, `yazi`, `fcitx5`, `hyprsunset`, and
`awww`. Zen Browser, Spotify, Processing, and the scripts under
`~/.local/bin/` are optional personal dependencies.

An example installation of the packages available in the Arch repositories:

```bash
sudo pacman -S --needed \
  hyprland waybar kitty mako neovim awww \
  pipewire wireplumber pavucontrol \
  brightnessctl playerctl grim slurp fastfetch yazi \
  fcitx5 hyprsunset \
  ttf-jetbrains-mono-nerd noto-fonts-cjk
```


## Required customization

At minimum, review these files:

- `hypr/modules/monitors.lua`: output names, resolutions, positions, scales,
  and workspace assignments
- `hypr/modules/input.lua`: keyboard layout and device names
- `hypr/modules/enviroments.lua`: cursor theme and size
- `hypr/modules/autostart.lua`: programs launched with Hyprland
- `hypr/modules/keybinds.lua`: installed applications and local scripts
- `waybar/waybar-horizonal/config.jsonc`: monitor names, battery name, and
  `hwmon` temperature path
- `waybar/waybar-vertical/config.jsonc`: output and backlight device

Useful commands for discovering local hardware identifiers:

```bash
hyprctl monitors
hyprctl devices
ls /sys/class/power_supply
for hwmon in /sys/class/hwmon/hwmon*; do
  [ -r "$hwmon/name" ] || continue
  IFS= read -r name < "$hwmon/name"
  printf '%s: %s\n' "$hwmon" "$name" 
done
```

The horizontal Waybar layout is started by `waybar/launch.sh`. Change that
script if you prefer the vertical layout.

## Preview

### Waybar

<p align="center">
  <img src="assets/screenshots/waybar-horizontal.png" alt="Waybar horizontal layout preview" width="100%">
</p>

### Mako

<p align="center">
  <img src="assets/screenshots/mako-preview.png" alt="Mako notification preview" width="420">
</p>

## Notes

- The Neovim configuration uses LazyVim and changes Kitty padding through
  Kitty's remote-control socket.
- The repository intentionally contains personal defaults and may change
  without preserving backward compatibility.


## Credits and licensing

The LazyVim starter files retain the Apache-2.0 license in `nvim/LICENSE`.

No repository-wide license has been selected for the remaining original files.
Third-party images and other assets remain subject to their respective
authors' terms.

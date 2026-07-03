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

The active Hyprland entry point is `hypr/hyprland.lua`. The old hyprlang
configuration is retained as `hypr/hyprland.conf.bak` for reference.

## Requirements

The main components are:

- Hyprland 0.55 or newer
- Waybar
- Kitty
- Mako
- PipeWire and WirePlumber
- JetBrains Mono Nerd Font and Noto Sans CJK JP

Several bindings and modules also use `brightnessctl`, `playerctl`, `grim`,
`slurp`, `pavucontrol`, `fastfetch`, `yazi`, `fcitx5`, `hyprsunset`, and
`awww`. Zen Browser, Spotify, Rofi, and the scripts under
`~/.local/bin/` are optional personal dependencies.

An example installation of the packages available in the Arch repositories:

```bash
sudo pacman -S --needed \
  hyprland waybar kitty mako awww \
  pipewire pipewire-pulse wireplumber pavucontrol \
  brightnessctl playerctl grim slurp fastfetch yazi rofi \
  fcitx5 hyprsunset \
  ttf-jetbrains-mono-nerd noto-fonts-cjk
```

## Required customization

At minimum, review these files:

- `hypr/modules/monitors.lua`: output names, resolutions, positions, scales,
  and workspace assignments
- `hypr/modules/input.lua`: keyboard layout and device names
- `hypr/modules/environments.lua`: cursor theme and size
- `hypr/modules/autostart.lua`: programs launched with Hyprland
- `hypr/modules/keybinds.lua`: installed applications and local scripts
- `waybar/waybar-horizontal/config.jsonc`: monitor names, battery name, and
  `hwmon` temperature path
- `waybar/waybar-vertical/config.jsonc`: output and backlight device
- `mako/config.light` and `mako/config.dark`: notification appearance and
  theme variants

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

## Preview

### Waybar

<p align="center">
  <img src="assets/screenshots/waybar-horizontal.png" alt="Waybar horizontal layout preview" width="100%">
</p>

### Mako

| Light | Dark |
| --- | --- |
| <img src="assets/screenshots/mako-light.png" alt="Mako notification preview in light theme" width="386"> | <img src="assets/screenshots/mako-dark.png" alt="Mako notification preview in dark theme" width="386"> |

## Credits and licensing
No repository-wide license has been selected for the original configuration files.  
Third-party images and other assets remain subject to their respective authors' terms.

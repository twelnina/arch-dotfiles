#!/bin/bash

killall -9 waybar
waybar -c ~/.config/waybar/waybar-horizontal/config.jsonc -s ~/.config/waybar/waybar-horizontal/style.css &

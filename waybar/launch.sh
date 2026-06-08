#!/bin/bash

killall -9 waybar
waybar -c ~/.config/waybar/waybar-horizonal/config.jsonc -s ~/.config/waybar/waybar-horizonal/style.css &

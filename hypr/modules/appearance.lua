hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 8,
		border_size = 0,
		resize_on_border = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 3,
		active_opacity = 1.0,
		inactive_opacity = 0.95,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 1,
			noise = 0.0,
			contrast = 0.9,
			brightness = 0.8,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 1,
		middle_click_paste = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 0,
	},
})

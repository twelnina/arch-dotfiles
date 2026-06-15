-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "intellij-opacity",
	match = { class = "jetbrains-idea" },
	no_blur = 1,
	opacity = 0.85,
})

hl.window_rule({
	name = "android-studio-appearance",
	match = { class = "jetbrains-studio" },
	no_blur = 1,
	opacity = 0.85,
})

hl.window_rule({
	name = "zen-appearance",
	match = { class = "zen" },
	no_blur = 1,
	opacity = 1,
})

hl.window_rule({
	name = "vsc-appearance",
	match = { class = "code" },
	no_blur = 1,
	opacity = 0.95,
})

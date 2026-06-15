hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "1920x0",
	scale = 1.25,
})

hl.monitor({
	output = "desc:Philips Consumer Electronics Company PHL 221E9 0x00003F99",
	mode = "1920x1080@75",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
	mirror = "eDP-1",
})

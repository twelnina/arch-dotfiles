local laptop_output = "eDP-1"
local external_output = "desc:Philips Consumer Electronics Company PHL 221E9 0x00003F99"

hl.monitor({
	output = laptop_output,
	mode = "1920x1200@60",
	position = "1920x0",
	scale = 1.25,
})

hl.monitor({
	output = external_output,
	mode = "1920x1080@75",
	position = "0x0",
	scale = 1,
})

for workspace = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(workspace),
		monitor = laptop_output,
	})
end

for workspace = 6, 10 do
	hl.workspace_rule({
		workspace = tostring(workspace),
		monitor = external_output,
	})
end

hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = 1,
	mirror = laptop_output,
})

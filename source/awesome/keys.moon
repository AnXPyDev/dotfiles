menubar = require "menubar"
awful = require "awful"
gears = require "gears"
log = require "log"

key = {
	mod: "Mod4"
	super: "Mod4"
	shift: "Shift"
	control: "Control"
}

keys = {}

keys.global = {
	{{key.super}, "d", () -> awful.spawn("dmenu_run")}
	{{key.super}, "Return", () -> awful.spawn("kitty")}
	{{key.super, key.shift}, "r", awesome.restart}
}

do
	key_table = {}
	for i, binding in ipairs(keys.global)
		key_table = gears.table.join(key_table, awful.key(table.unpack(binding)))
	root.keys(key_table)




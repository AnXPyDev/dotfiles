pcall(require, "luarocks.loader")

gears = require "gears"
awful = require "awful"

require "awful.autofocus"

wibox = require "wibox"
beautiful = require "beautiful"
naughty = require "naughty"
menubar = require "menubar"

require "keys"

wallpaper = require "wallpaper"

-- screen.connect_signal("property::geometry", wallpaper.set_random)

cord = require "cord"

Container = require "cord.wim.container"
Textbox = require "cord.wim.textbox"
FitLayout = require "cord.wim.layout.fit"

Trait = require "cord.wim.trait.base"

class HoverTrait extends Trait
	new: =>
		super!

	connect: (node) =>
		node\connect_signal("mouse_enter", () ->
			cord.wim.animation.color.lerp(node, node.data\get("background"), node.style\get("hover_background") or "#FFFFFF", "background")
			cord.wim.animation.size.lerp(node, node.data\get("size"), node.style\get("hover_size"))
		)
		
		node\connect_signal("mouse_leave", () ->
			cord.wim.animation.color.lerp(node, node.data\get("background"), node.style\get("background"), "background")
			cord.wim.animation.size.lerp(node, node.data\get("size"), node.style\get("size"))
		)


sheet = require "style"

awful.screen.connect_for_each_screen((screen) ->
	awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, screen, awful.layout.suit.spiral)
	wallpaper.set_random(screen)

	screen.bar = awful.wibar {
		screen: screen
		position: "top"
		bg: "#000000"
		height: 50
	}

	boxes = {}

	for i = 1, 9

		textbox = Textbox({
			sheet, {"text"}
			text: "#{i}"
		})

		test_box = Container({sheet, {"test_button"}, {HoverTrait()}}, textbox)

		table.insert(boxes, test_box)



	layout = FitLayout({
		sheet
		{"layout"}
	}, table.unpack(boxes))

	screen.bar\setup {
		layout: wibox.layout.fixed.horizontal
		layout.widget
	}
)

client.connect_signal("manage", (c) ->
	awful.placement.no_offscreen(c)
)

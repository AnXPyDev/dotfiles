gears = require "gears"

get_random = () ->
	for file in io.popen("find #{os.getenv("HOME")}/.wallpapers -type f | shuf -n 1")\lines()
		return file

set_wallpaper = (screen, path) ->
	surf = gears.surface.load(path)
	gears.wallpaper.maximized(surf, screen, false)

set_random = (screen) ->
	set_wallpaper(screen, get_random())

return {
	get_random: get_random
	set: set_wallpaper
	set_random: set_random
}

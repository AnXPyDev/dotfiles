cord = require "cord"
Stylesheet = require "cord.wim.stylesheet"
Style = require "cord.wim.style"

sheet = Stylesheet()

sheet\add_style({"test_button"}, Style({
  padding: cord.util.margin(2)
  background: "#FF0000"
  hover_background: "#FFAAAA"
  foreground: "#FFFFFF"
  size: cord.math.vector(50)
  hover_size: cord.math.vector(100, 50)
  shape: cord.util.shape.rectangle(2)
  position_animation: cord.wim.animation.position.lerp
  hover_shape_corner_radius: 20
  position_animation_speed: 0.2
  size_lerp_animation_speed: 0.2
  opacity_animation_speed: 0.01
  color_lerp_animation_speed: 0.2
  margin_lerp_animation_speed: 0.3
  scalar_lerp_animation_speed: 0.3
  visible: true
}))

sheet\add_style({"layout"}, Style({
	size: cord.math.vector(1280, 50)
}))

return sheet

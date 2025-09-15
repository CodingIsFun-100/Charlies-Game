extends ColorRect

# This variable will store the duration for the fade animation.
var fade_animation_duration = 10

@onready var shader_material = material as ShaderMaterial

func _ready():
	%Timer.start()
	# Get the total wait_time from the Timer node.
	var timer_total_duration = %Timer.wait_time
	
	# Get the shader material from the node.
	
	var tween1 = create_tween()
	
	# Delay the start of the tween. This creates a pause before the animation begins.
	tween1.tween_interval(timer_total_duration - (0.5*timer_total_duration))
	
	# Animate the "static_noise_intensity" shader parameter.
	# The duration for this tween is set by the new variable.
	tween1.tween_property(shader_material, "shader_parameter/static_noise_intensity", 1.5, fade_animation_duration)

func _process(_delta: float) -> void:
	%Label.text = str(round(%Timer.time_left))

func _on_timer_timeout() -> void:
	%GM.visible = true
	# Correct way to set a shader parameter.
	shader_material.set_shader_parameter("static_noise_intensity", 0)

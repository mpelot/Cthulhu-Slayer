extends ColorRect

var shader_material: ShaderMaterial
var count_til_offset: float = 0.1

func _ready():
	shader_material = material
	
func _process(delta):
	count_til_offset -= delta
	if(count_til_offset <= 0):
		offset_noise()
		count_til_offset = 0.1

func offset_noise():
	print("offseting noises")
	var offset_x = randf_range(-30, 30)
	var offset_y = randf_range(-30, 30)
	print(Vector2(offset_x, offset_y))
	shader_material.set_shader_parameter("offset", Vector2(offset_x, offset_y))

shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;
uniform float outerRadius : hint_range(0.0, 5.0) = 2;
uniform float MainAlpha : hint_range(0.0, 1.0) = 0.2;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float x = abs(UV.x-.5)*2.0;
	float y = abs(UV.y-.5)*2.0;
	float v = (sqrt((x*x)+(y*y))/outerRadius);
	COLOR = vec4(0,0,0,v*MainAlpha) * texture(screen_texture, UV);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

shader_type canvas_item;


uniform sampler2D noise_texture : repeat_enable;
uniform float magnitude_threshold = 1.0f;
uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 noise_offset;

void vertex() {
	// Called for every vertex the material is visible on.
}

bool check_surrounding(sampler2D screen, vec2 position){
	ivec2 screen_size = textureSize(screen,0);
	for (float x_offset = -1.0; x_offset < 2.0; x_offset++){
		for (float y_offset = -1.0; y_offset < 2.0; y_offset++){
			vec2 check_coordinate = vec2(position.x + x_offset/float(screen_size.x), position.y + y_offset/float(screen_size.y));
			float color_magnitude = length(texture(screen, check_coordinate));
			if(color_magnitude > length(vec4(0,0,0,1))){
				
				return true;
			}
		}
	}
	return false;
}

void fragment() {
	
	// Called for every pixel the material is visible on.
	COLOR = texture(screen_texture, SCREEN_UV);
	float noise_level = texture(noise_texture, UV.xy + noise_offset).r;
	noise_level = max(noise_level, magnitude_threshold - noise_offset.y/30.0);
	COLOR = noise_level * COLOR;	

}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
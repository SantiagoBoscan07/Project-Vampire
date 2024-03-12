shader_type canvas_item;
uniform float height = 1.0;
uniform float speed = 5.0;
void vertex() {
	VERTEX.y += height * sin(speed * TIME);
}

shader_type canvas_item;
void fragment() {
    float wave = sin(FRAGCOORD.y * 0.1 + TIME) * 0.2;
    COLOR.rgb += wave;
}

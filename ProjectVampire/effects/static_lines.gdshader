shader_type canvas_item;
void fragment() {
    float wave = sin(FRAGCOORD.y * 0.3 + TIME) * 0.1;
    COLOR.rgb += wave;
}

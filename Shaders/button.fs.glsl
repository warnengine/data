#version 420

out vec4 color;

in vec3 o_color;
in vec2 o_resolution;
in float o_state;

void main() {
    color = vec4(o_color + /*o_state * */vec3(0.1,0.1,0.1), 0.6);
}
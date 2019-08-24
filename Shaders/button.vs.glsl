#version 420

layout(location = 0) in vec2 position;

uniform vec3 i_color;
uniform vec2 i_resolution;
uniform vec2 i_position;
uniform float i_state;

out vec3 o_color;
out vec2 o_resolution;
out float o_state;

void main() {
    gl_Position = vec4(position+i_position-vec2(1.0,-1.0), 0.0, 1.0);
    o_color = i_color;
    o_resolution = i_resolution;
    o_state = i_state;
}
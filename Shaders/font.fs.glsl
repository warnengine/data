#version 420

out vec4 frag_colour;
uniform sampler2D sampler_text;

in vec2 o_uv;

uniform vec3 i_color;

void main() {
    vec4 diffuse_color = texture(sampler_text, o_uv).rgba;
    // Black color means transparent
    // diffuse_color.a = diffuse_color.r;
    // diffuse_color.rgb = i_color;
    diffuse_color.rgb = vec3(1.0,1.0,1.0);
    frag_colour =  diffuse_color;
}
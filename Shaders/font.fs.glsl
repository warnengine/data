#version 420

out vec4 frag_colour;
uniform sampler2D samplerText;

in vec2 o_uv;

void main() {
    vec4 DiffuseColor = texture(samplerText, o_uv).rgba;
    frag_colour =  DiffuseColor;
}
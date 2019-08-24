#version 330
#extension GL_ARB_shading_language_420pack : enable

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 textCoord;
layout(location = 2) in vec3 i_normal;

out vec2 o_uv;
out vec3 o_normal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;

mat4 bias = 
        (0.5, 0.0, 0.0, 0.0,
	0.0, 0.5, 0.0, 0.0,
	0.0, 0.0, 0.5, 0.0,
	0.5, 0.5, 0.5, 1.0);
uniform mat4 lightProjection;
uniform mat4 lightView;

out vec4 shadowCoord;

void main() {
    gl_Position = projection*view*model*vec4(position, 1.0);
    o_uv = textCoord;
    o_normal = (model * vec4(i_normal,0.0)).xyz;
    shadowCoord = bias*lightProjection*lightView*model*vec4(position, 1.0);
}

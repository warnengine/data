#version 420

layout(location = 0) in vec3 position;
layout(location = 2) in vec3 i_normal;

out vec3 o_normal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;

uniform mat4 bias;
uniform mat4 lightProjection;
uniform mat4 lightView;

out vec4 shadowCoord;

void main() {
    gl_Position = projection*view*model*vec4(position, 1.0);
    o_normal = (model * vec4(i_normal,0.0)).xyz;
    shadowCoord = bias*lightProjection*lightView*model*vec4(position, 1.0);
}

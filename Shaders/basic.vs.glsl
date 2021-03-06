#version 330
#extension GL_ARB_shading_language_420pack : enable

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 textCoord;
layout(location = 2) in vec3 iNormal;

out vec2 oUV;
out vec3 oNormal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat4 bias;
uniform mat4 lightProjection;
uniform mat4 lightView;
uniform mat4 lightModel;

out vec4 shadowCoord;

void main() {
  gl_Position = projection * view * model * vec4(position, 1.0);
  oUV = textCoord;
  oNormal = (model * vec4(iNormal, 0.0)).xyz;
  shadowCoord =
      bias * lightProjection * lightView * lightModel * vec4(position, 1.0);
}

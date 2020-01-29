#version 330
#extension GL_ARB_shading_language_420pack : enable

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 textCoord;
layout(location = 2) in vec3 iNormal;
layout(binding = 2) uniform sampler2D terrainMap;

out vec2 oUV;
out vec3 oNormal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat4 bias;
uniform mat4 lightProjection;
uniform mat4 lightView;

out vec4 shadowCoord;

void main() {
  vec4 pos =
      projection * view * model *
      vec4(position.x, texture(terrainMap, textCoord).r, position.z, 1.0);
  // vec4 pos = projection*view*model*vec4(position.x, 0.0, position.y, 1.0);
  gl_Position = pos;
  oUV = textCoord;
  oNormal = (model * vec4(iNormal, 0.0)).xyz;
  shadowCoord = bias * lightProjection * lightView * model *
                vec4(position.x, 0.0, position.z, 1.0);
}

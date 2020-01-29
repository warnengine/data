#version 330
#extension GL_ARB_shading_language_420pack : enable

out vec4 fragColour;
layout(binding = 0) uniform sampler2D diffuseTexture;
layout(binding = 1) uniform sampler2D shadowMap;

uniform int castShadow;

in vec2 oUV;
in vec3 oNormal;

in vec4 shadowCoord;

vec4 ambientLight = vec4(0.6, 0.6, 0.6, 1.0);
vec3 lightDirection = vec3(-1.0, -1.0, -1.0);

void main() {
  vec4 diffuseColor = texture(diffuseTexture, oUV).rgba;

  float cosTheta = clamp(dot(-lightDirection, oNormal), 0.0, 1.0);

  float bias = 0.005 * tan(acos(cosTheta));
  bias = clamp(bias, 0.0, 0.01);

  float shadow = 1.0;
  if (texture(shadowMap, shadowCoord.xy).r < shadowCoord.z - bias &&
      castShadow == 1) {
    shadow = 0.7;
  }

  fragColour = (ambientLight * diffuseColor);
  fragColour = vec4(fragColour.xyz * shadow, fragColour.w);
}

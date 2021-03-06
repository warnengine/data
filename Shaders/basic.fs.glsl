#version 420

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

  /*vec4 lightAddition = vec4(0.2,0.1,0.1,1.0);
  if (cosTheta > 0.95) {
      lightAddition = vec4(1.0,0.5,0.5,1.0);
  } else if (cosTheta > 0.5) {
      lightAddition = vec4(0.6,0.3,0.3,1.0);
  } else if (cosTheta > 0.25) {
      lightAddition = vec4(0.4,0.2,0.2,1.0);
  }*/

  fragColour = (ambientLight * diffuseColor) /*+ lightAddition*/;
  fragColour = vec4(fragColour.xyz * shadow /** cosTheta*/, fragColour.w);
}
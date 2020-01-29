#version 330 core
#extension GL_ARB_shading_language_420pack : enable

// Ouput data
layout(location = 0) out float fragmentdepth;

void main() {
  // Not really needed, OpenGL does it anyway
  // fragmentdepth = gl_FragCoord.z;
}
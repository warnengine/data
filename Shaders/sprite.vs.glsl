#version 330

layout(location = 0) in vec2 position;
layout(location = 1) in vec2 textCoord;

out vec2 o_uv;

void main() {
  gl_Position = vec4(position - vec2(1.0, -1.0), 0.0, 1.0);
  o_uv = textCoord;
}

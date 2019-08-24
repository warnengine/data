#version 420

out vec4 frag_colour;
layout(binding=1) uniform sampler2D shadowMap;

uniform int castShadow;

in vec3 o_normal;

in vec4 shadowCoord;

vec4 ambientLight = vec4(0.6, 0.6, 0.6, 1.0);
vec3 lightDirection = vec3(-1.0,-1.0,-1.0);

void main() {
    
    float cosTheta = clamp(dot(-lightDirection, o_normal), 0.0, 1.0);

    float bias = 0.005*tan(acos(cosTheta)); // cosTheta is dot( n,l ), clamped between 0 and 1
    bias = clamp(bias, 0.0,0.01);

    float shadow = 0.0;
    for(int x = -2; x <= 2; ++x) {
        for(int y = -2; y <= 2; ++y) {
            if ( texture( shadowMap, shadowCoord.xy).z  <  shadowCoord.z-bias && castShadow == 1){
                shadow += 0.7;
            }
        }
    }
    shadow /= 9;

    float lightIntensity;


    frag_colour =  ambientLight * diffuseColor;
    frag_colour = vec4(frag_colour.xyz * (1-shadow), frag_colour.w);
}
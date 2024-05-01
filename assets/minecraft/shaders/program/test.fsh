#version 150

uniform sampler2D DiffuseSampler;
uniform float Time;
in vec2 texCoord;

out vec4 fragColor;

float random(float n) { return fract(sin(n*(91.3458)) * 47453.5453); }

void main(){
    vec2 a = vec2(texCoord.x + (sin(texCoord.y*10*random(Time)*0.1) / random(random(Time)*texCoord.y)*0.001),texCoord.y);
    vec4 color = texture(DiffuseSampler, a);
    fragColor = color;
   
}
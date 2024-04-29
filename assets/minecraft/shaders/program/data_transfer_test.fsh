#version 150

uniform sampler2D DiffuseSampler;

uniform vec4 ColorModulate;

in vec2 texCoord;

out vec4 fragColor;

void main(){
    vec4 a = texture(DiffuseSampler, vec2(0.0,0.0)); //get the data that was prev stored
    if (a.r == 1.0) { //check for stored data
        fragColor = vec4(0.0,0.0,1.0,1.0); //blue success
    } else { 
        fragColor = vec4(0.0,1.0,0.0,1.0); //green fail
    }
    
    if (texCoord == vec2(0.0,0.0)) { //store data
        fragColor.r = 1.0;
    }
}

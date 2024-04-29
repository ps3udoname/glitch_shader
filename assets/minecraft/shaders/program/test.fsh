#version 150

uniform sampler2D DiffuseSampler;
in vec2 UV0;
uniform vec4 ColorModulate;
uniform float Time;
in vec2 texCoord;

out vec4 fragColor;

float random(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float roundUpToBase(float n, float divisor) {
    return n + (divisor - (mod(n,divisor)));
} 

float burstRng(float time,float rnd,float g)  { //using color can be less than suboptimal depending on usecase
    return tan(tan(time + 1.05)) + tan(rnd);
}

void main(){
    float rnd0 = clamp(random(vec2(Time , 9545.0)),0.0,1); //rng
    float rnd0a  = clamp(random(vec2(rnd0 , 9545.0)),0.0,1);
    float width = clamp(random(vec2(rnd0 , 9545.0)),0.0,0.4);
    float height = clamp(random(vec2(rnd0 , 9545.0)),width+0.02,0.7);
    vec4 color = texture(DiffuseSampler, texCoord);
    float burstRng = burstRng(Time, rnd0a, color.g);
    //vec4 extendData = texture(DiffuseSampler, vec2(0.0,0.0)); //get the data that was stored

    if (burstRng == 0 ) { //pick random point in time //testing
        color = vec4(0.0,0.0,0.0,0.0);
        // color.g = texture(DiffuseSampler, texCoord+burstRng).g; //color shifting
        // if (texCoord.x >= burstRng && texCoord.x <= burstRng+width && texCoord.y >= rnd0a && texCoord.y <= rnd0a+height) { //find rectangle starting point
        //     color = texture(DiffuseSampler, texCoord+rnd0a-0.1);
        // }
    } 

        fragColor = color;
   
}

/* testing tool
if ( a <= 1 ) {
    color = vec4(0.0,0.0,0.0,0.0);
} 
pick rng time
make incrementer

    /*if (texCoord.x > 0.5 && texCoord.x < 0.8 && texCoord.y > 0.3 && texCoord.y < 0.7) { //gen rectangle
        //         color = texture(DiffuseSampler, texCoord+0.1);
        //     }*/
        //     /*if (!(extendData.a == 1.0)) { //if data hasnt been stored or is restarting
        //         extendData = vec4(0.0,0.0,1.0,1.0); //show its extending
        //     }*/



        /*if (extendData.b == 1.0) { //if extending
            color.g = texture(DiffuseSampler, texCoord+0.03).g; //do effect - shift one channel a bit 
            extendData = vec4(extendData.r+0.1,0.4,0.0,1.0); //count how many times effect done
            
            if (extendData.r >= 0.9) { //if effect applied n times, stop doing it
                extendData = vec4(0.0,0.0,0.0,0.0); //reset
            }
        }

        find rrectangle position draw rectangle from there
        
        //testing
        if (texCoord == vec2(0.0,0.0)) {fragColor = extendData;} //store data
        else {fragColor = color;}*/
        //color = vec4(Time,0.0,0.0,0.0);


//if (!extended) {extend = Time + 0.8; if (extend > 1) {extend = 1;} extended = true;}
//if (extend == Time) {extended = false;}
/*
//2D (returns 0 - 1)
float random2d(vec2 n) { 
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float randomRange (in vec2 seed, in float min, in float max) {
		return min + random2d(seed) * (max - min);
}

// return 1 if v inside 1d range
float insideRange(float v, float bottom, float top) {
   return step(bottom, v) - step(top, v);
}

//inputs
float AMT = 0.2; //0 - 1 glitch amount
float SPEED = 0.6; //0 - 1 speed
   
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
    float time = floor(iTime * SPEED * 60.0);    
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    //copy orig
    vec3 outCol = texture(iChannel0, uv).rgb;
    
    //randomly offset slices horizontally
    float maxOffset = AMT/2.0;
    for (float i = 0.0; i < 10.0 * AMT; i += 1.0) {
        float sliceY = random2d(vec2(time , 2345.0 + float(i)));
        float sliceH = random2d(vec2(time , 9035.0 + float(i))) * 0.25;
        float hOffset = randomRange(vec2(time , 9625.0 + float(i)), -maxOffset, maxOffset);
        vec2 uvOff = uv;
        uvOff.x += hOffset;
        if (insideRange(uv.y, sliceY, fract(sliceY+sliceH)) == 1.0 ){
        	outCol = texture(iChannel0, uvOff).rgb;
        }
    }
    
    //do slight offset on one entire channel
    float maxColOffset = AMT/6.0;
    float rnd = random2d(vec2(time , 9545.0));
    vec2 colOffset = vec2(randomRange(vec2(time , 9545.0),-maxColOffset,maxColOffset), 
                       randomRange(vec2(time , 7205.0),-maxColOffset,maxColOffset));
    if (rnd < 0.33){
        outCol.r = texture(iChannel0, uv + colOffset).r;
        
    }else if (rnd < 0.66){
        outCol.g = texture(iChannel0, uv + colOffset).g;
        
    } else{
        outCol.b = texture(iChannel0, uv + colOffset).b;  
    }
       
	fragColor = vec4(outCol,1.0);
}*/
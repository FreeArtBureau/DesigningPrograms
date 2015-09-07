
class FontAgent {
  float x, y;
  float motion;


  FontAgent(float x, float y) {
    this.x = x;
    this.y = y;
  } 

  void render() {
    // noFill();
    //stroke(0); 
    noStroke();
    fill(255, 53);
    ellipse(x, y, motion, motion);
  }


  //ORIGINAL NOISE ALGO [very little diff between this and algo 3]
  void animate1() {

     // it's really a verbose & criptic way to write this Andreas !
    motion = noise(x * 0.01 + sin(frameCount * 0.0013)*7, y * 0.01 + sin(frameCount * 0.0013)*7) * 56;
  }
  
  // WITH noiseZ [very little diff between this and algo 4]
  void animate2(float nAMM) {
    
  float noiseScale = 0.007; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale, y * noiseScale, noiseZ) * nAMM;//Last number will increase ellipse diameter
  }

  //MULTIPLYING noiseZ
  // 
  void animate3(float nAMM) {
    
  float noiseScale = 0.007; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale * noiseZ, y * noiseScale * noiseZ) * nAMM;
  }
  //ADDING noiseZ
  // 
  void animate4(float nAMM) {
    
  float noiseScale = 0.007; //Smaller numbers give less variation in the noise val.
  float noiseZ = frameCount*0.004;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale + noiseZ, y * noiseScale + noiseZ) * nAMM;
  }
}



/*
STUDY THESE METHODS CAREFULLY & EXPLAIN THEM
 
 
 void animate2() {
 float offs = frameCount * 0.04 + (x + y) * 0.01; // THIS CALCULATION IS INTERESTING WITH THE X & Y
 finalDia = sin(offs) * 13 + 23 * 1.2;
 } 
 
 void animate3() {
 float noiseScaler = 0.008; //if this number gets smaller the circles will look more similar in size
 float ang = frameCount * 0.01; //if this number gets bigger the movement will be more nervous... play around!
 float rad = width/2;// WHAT IS THIS DOING ?
 
 // AND HERE TOO THE x + & then * rad is interesting. 
 float nx = (x + cos(ang) * rad) * noiseScaler; 
 float ny = (y + sin(ang) * rad) * noiseScaler;
 finalDia = noise(nx, ny) * 33 + 10; //for more variation you could still add a z in noise...
 }
 
 
 */

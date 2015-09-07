
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
    fill(255,53);
    ellipse(x, y, motion, motion);
  }

  void animate1() {
    float noiseScale = 0.007; //Smaller numbers give less variation in the noise val.
    float noiseZ = frameCount*0.004;//Greater numbers will make the motion more nervous.

    //ORIGINAL NOISE ALGO
    //motion = noise(x * 0.01 + sin(frameCount * 0.0013)*7, y * 0.01 + sin(frameCount * 0.0013)*7) * 23;

    //NOISE ALGO WITH CONTROL VARIABLES noiseScale & noiseZ
    //motion = noise(x * noiseScale, y * noiseScale, noiseZ) * 43;//Last number will increase ellipse diameter
    //TRY THIS AND NOTICE THE DIFF. THE TEXT DEFORMS MORE & MORE.
    //motion = noise(x * noiseScale * noiseZ, y * noiseScale * noiseZ) * 63;
    //motion = noise(x * noiseScale + noiseZ, y * noiseScale + noiseZ) * 63;
    
    motion = noise(x * noiseScale, y * noiseScale, noiseZ) * 63;


  }
}



class FontAgent {
  float x, y;
  float motion;
  float angle;

  FontAgent(float x, float y) {
    this.x = x;
    this.y = y;
    angle = radians(0);
  } 

  void render() {
    noFill();
    stroke(255);
    pushMatrix();
    translate(x, y);
    //if (ROTATE) {
    rotate(angle);
    //}

    line(0, 0, motion, motion);
    popMatrix();
  }

  void animate1(float nAmm) {
    float noiseScale = 0.007; //Smaller numbers give less variation in the noise val.
    float noiseZ = frameCount*0.007;//Greater numbers will make the motion more nervous.

    motion = noise(x * noiseScale, y * noiseScale, noiseZ) * nAmm;//Last number will increase ellipse diameter
  }
}


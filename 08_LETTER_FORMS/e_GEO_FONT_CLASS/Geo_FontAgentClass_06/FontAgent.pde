class FontAgent {
  float x;
  float y;
  float dia;
  float motion;
  float spotLight;
  // Change these to create different spotlight FX
  int spotSize = 50;
  float spotFactor = 1.4;

  FontAgent(float x, float y, float dia) {  
    this.x  = x;
    this.y = y;
    this.dia =0;
  }

  void render() {
    noStroke();
    fill(255);
    ellipse(x, y, dia+motion, dia+motion);
  }

  void animate1() {

    float noiseScaler = 0.007;
    float noiseZ = frameCount*0.0035;
    motion = noise(x * noiseScaler, y * noiseScaler, noiseZ)*13;
  }


  // In this method we apply a spot light effect by calculating distance
  // between current mouse position & the position of the agent (x&y) 
  void interaction() {
    // Calculate distance between mouse position & x,y positions
    spotLight = dist(mouseX-width/2, mouseY-height/1.7, x, y);

    // Nice calculation here
    dia = ((spotSize/spotLight)+1) * spotFactor;
  }
}


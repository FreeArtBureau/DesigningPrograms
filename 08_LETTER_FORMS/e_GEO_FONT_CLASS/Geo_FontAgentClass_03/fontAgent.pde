
class FontAgent {

  float x, y;
  float xOff, yOff;
  float vx, vy; // x,y velocity
  float dia;
  float forceX = 0.2;
  float forceY = 0.2;

  float max_distance;


  FontAgent(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    max_distance = dist(0, 0, width, height);
  } 
  
    void render() {
    noStroke();
    fill(255,173);
    ellipse(x+xOff, y, dia, dia);
  }


  void animate1() {

    float spring = dist(mouseX, mouseX, x, y);
    dia = spring/max_distance * 33;
    
   float fact = map(mouseY, 0, height, 0.01, 10.0);
    xOff = spring/fact;
  } 

}


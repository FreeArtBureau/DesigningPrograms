class Particle {
 float x;
float y;
float dia;
float d; //color mapping
color c;
//String letter;

Particle(float x, float y){
 this.x = x;
 this.y = y;
 d = random(50);
 dia = 2;
 c = color(0,0,255);
// letter = "TYPE";
  
}
  
  void render() {
   fill(c);
  ellipse(x, y, dia, dia);
  }
  
  //////////////////// LETTER INTERACTION FUNCTION

  float distance(Particle p)
  {
    return dist(this.x, this.y, p.x, p.y);
  }
  


  
}

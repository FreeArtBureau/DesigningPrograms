////////////////////// CLASS VECTOR

class FontAgent {

  PVector loc;
  PVector vel;
  float offX, offY;
  float xMove;
  float dia;
  color c;

  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0.005, 0);
    dia = 1;
    c = GetSomeColour();
  }


  void Render() {
    fill(c, 97);
//    fill(255);
    noStroke(); 
    ellipse(loc.x, loc.y, dia, dia);
     /*
     strokeWeight(0.2);
     stroke(c, 17); 
     line(loc.x+5, loc.y, loc.x, loc.y+5);
     */
    //point(loc.x, loc.y);
  }

  void Update() {
    loc.add(vel);
  }

  // Different Motion Methods
  void Animate1() {
    offX = frameCount * (loc.x + loc.y);
    offY = frameCount * (loc.x + loc.y);
    loc.x += sin(offX) * OFFXFAC;
    loc.y += cos(offY) * OFFYFAC;
  }

  void Animate2() {
    offX = noise(loc.x*frameCount*0.05, loc.y*frameCount*0.05) * NOISEAMMX;
    loc.x += cos(offX) * NOISEXFAC; // + offX;
    loc.y += sin(offX) * NOISEYFAC;
    //loc.x += sin(frameRate*0.9)*0.5;// + offX;

    //loc.y += sin(frameRate*0.05)*0.5;// + offX;
  }

  void Animate3() {
    offX = noise(loc.x*frameCount*0.5, loc.y*frameCount*0.5) * NOISEAMMX;
    loc.x -= cos(offX)*NOISEXFAC;// + offX;
    loc.y -= sin(offX)*NOISEYFAC;// + offX;
    //loc.x += sin(frameRate*90)*0.5;// + offX;
  }

  void Animate4() {
    offX = noise(loc.x*frameCount*0.5, loc.y*frameCount*0.5)*30;
    loc.y += cos(offX)*0.02;// + offX;
    loc.y -= cos(offX)*0.5;// + offX;
    loc.x += sin(frameRate*90)*0.5;// + offX;
  }

  color GetSomeColour() {
    return c = MYCOLOURS[(int)random(MYCOLOURS.length)];
  }

  ////////////////////////////////////////////////
  /*   
   void check() {
   if(loc.x > width) {
   loc.x = 0;
   } 
   if(loc.x < 0) {
   loc.x = width;
   } 
   
   if(loc.y > height) {
   loc.y = 0;
   } 
   if(loc.y < 0) {
   loc.y = height;
   } 
   }
   */
}


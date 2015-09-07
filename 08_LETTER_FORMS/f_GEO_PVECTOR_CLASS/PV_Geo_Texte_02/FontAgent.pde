/*
Class FontAgent pour dessiner des formes simples et avoir 
 des comportements uniques à chaque forme.
 */



class FontAgent {

  PVector loc;
  PVector vel;

  float dia;
  float offX;
  float xRand;
  float lifespan = 255;
  float spotLight;
  float spotSize = 25;
  float spotFact = 1.7;

  FontAgent(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector (0.1, 0);
    dia = 1;
  }

  void display() {
    noStroke();
    fill(lifespan);
    ellipse(loc.x, loc.y, dia, dia);
  }

  void animate1() {
    offX +=  noise(loc.x*0.001, loc.y*0.001)*100;
    // xRand = sin(xMove)*100;
    loc.x += cos(offX*0.005)*5;

    lifespan -= 1.39;
  }


  void animate2() {
    offX = frameCount + (loc.x + loc.y);
    //     dia+= noise(offX*0.05) * 0.05;
    loc.x += noise(offX*0.05, offX*0.05)*5.5;

    lifespan -= 1.39;
  }

  void animate3() {
    offX = frameCount + (loc.x + loc.y);
    float offY = sin(frameCount*(loc.y+loc.x))*0.95;
    //     dia+= noise(offX*0.05) * 3.05;
    //loc.x += noise(offX*0.05, offX*0.05)*5.5;
    loc.x += noise(offX*0.5)*3.55;
    loc.y += sin(offY*0.5)*3.3;
    lifespan -= 1.39;
  }

  void animate4() {
    offX = frameCount + (loc.x) * 50;
    float offY = frameCount + (loc.y) * 55;
    loc.x += cos(offX*0.005)*0.55;
    loc.y += sin(offY*0.005)*0.3;
    lifespan -= 1.39;
  }

  void interaction() {
   spotLight = dist(mouseX-transX, mouseY-transY, loc.x, loc.y);   
   dia = ((spotSize/spotLight)+0.3) * spotFact;
  }
}


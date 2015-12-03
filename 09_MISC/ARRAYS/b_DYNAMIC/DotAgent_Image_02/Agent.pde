
////////////////////////////////////// CLASS 
class Agent {
  // Class data
  float x, y;
  float angle;
  float dia, len, W;
  color pic;

  ///////////////////////////////////// CONSTRUCTOR 01
  Agent(float x, float y, float dia) {
    this.x = x;
    this.y = y;
    this.dia = dia;
    angle = 0;
    len = 10;
    W = 1.0;
  }



  //////////////////////////// METHODS
  void displayDots() {
    //WE GET THE COLOUR VALUE OF THE PIXEL AT COORDINATE X,Y
    pic = a.get(int(x), int(y));
 
    /*
   YOU CAN'T TEST WITH 
     if (myc == 0)
     YOU NEED TO SPECIFIY THAT 0 IS OF DATA TYPE COLOR. 
     OTHERWISE HOW DO WE KNOW WHAT 0 IS ? 
     */
    //WE THEN TEST TO SEE IF THAT COLOUR VALUE IS BLACK
    if ((pic >= color(0)) && (pic <= color(30))) {
      noStroke();
      //fill(myc,33);
      fill(255);
      //IF WE CALL DIA HERE WE CREATE A NEW DIA VALUE EVERY TIME THE  DISPLAY() 
      //FUNCTION IS CALLED IN DRAW()
      pushMatrix();
      translate(x, y);
      dia = random(1, 33);
      ellipse(0, 0, dia, dia);
      popMatrix();
    }
    // IDEA : perhaps use other colour ranges
    // to add other colours
      if ((pic >= color(60)) && (pic <= color(230))) {
      noStroke();
      //fill(myc,33);
      fill(0,0,255);
      //IF WE CALL DIA HERE WE CREATE A NEW DIA VALUE EVERY TIME THE  DISPLAY() 
      //FUNCTION IS CALLED IN DRAW()
      pushMatrix();
      translate(x, y);
      //dia = random(1, 17);
      ellipse(0, 0, dia, dia);
      popMatrix();
    }

    //else null;
  }
  
  void displayLines(int _THRESH_MAX) {
    pic = a.get(int(x), int(y));
    if ((pic >= color(0)) && (pic <= color(_THRESH_MAX))) {
      noFill();
      stroke(pic); 
      strokeWeight(W);     
      pushMatrix();
      translate(x, y);
      line(-len, 0, len, 0);
      popMatrix();
    }
    //else null;
  }
  
    void displayJOY(float nScale, float nAmm) {
    pic = a.get(int(x), int(y));
    if ((pic >= color(0)) && (pic <= color(30))) {
      noStroke();
      fill(pic);
      float yDiff = sin(4*0.5) * 10;
      float joyDiv = noise(x*nScale, y*nScale) * nAmm;
      
      pushMatrix();
      translate(x, y);
      ellipse(0, 0+yDiff, dia+joyDiv, dia+joyDiv);
      popMatrix();
    }
    //else null;
  }

  void motion(float nAmm) {
    angle += noise(x*0.005, y*0.005) * nAmm;
    
    x += cos(angle*0.05) * 3;
    y += sin(angle*0.05) * 3;
  }
}


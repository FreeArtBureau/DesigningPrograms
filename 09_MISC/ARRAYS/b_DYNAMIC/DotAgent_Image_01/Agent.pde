class Agent {
  float x, y;
  float dia;
  float speed = 7.5;
  color pic;
  color myc = somecolour();

  // CONSTRUCTOR 01
  Agent(float x, float y, float dia) {
    this.x = x;
    this.y = y;
    this.dia = dia;
  }

  // CONSTRUCTOR 02
  Agent(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    //WE GET THE COLOUR VALUE OF THE PIXEL AT COORDINATE X,Y
    pic = a.get(int(x), int(y));
    /*
   YOU CAN'T TEST WITH 
     if (myc == 0)
     YOU NEED TO SPECIFIY THAT 0 IS OF DATA TYPE COLOR. 
     OTHERWISE HOW DO WE KNOW WHAT 0 IS ? 
     */
    //WE THEN TEST TO SEE IF THAT COLOUR VALUE IS BLACK
    if (pic == color(0)) {
      noStroke();
      fill(myc, 33);
      dia = random(1, 7);
      ellipse(x, y, dia, dia);
    }
    //else null;
  }


  void motion() {
    float angle = noise(x*300, y*300) * 300;
    x += sin(angle) * speed;
    y += cos(angle) * speed;
  }
}

// GRAB SOME RANDOM GOODCOLOUR -------------------------------------------------------------
color somecolour() {
  // pick some random good color
  return goodcolour[int(random(goodcolour.length))];
}


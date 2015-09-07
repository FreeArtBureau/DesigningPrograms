/////////////////////////// FUNCTIONS DESSIN ///////////////

// Varialbes globales de dessin
float STROKEW = 1;
float LINE_LN;
float LINE_LN2;
float ANGLE_1 = radians(0);
;
int INTERVALLE;
boolean CIRCLES = false;
boolean FILL_IN = false;
float DIA, XOFF, YOFF;


////////////////////////////////// TRAME / GRID
void trameH() {

  for (int xPos=10; xPos<width-10; xPos+=INTERVALLE) {
    for (int yPos=10; yPos<height-10; yPos+=INTERVALLE) {

      color pix = glyphs[INDEX].get(int(xPos), int(yPos));
      if ((pix >= color(0)) && (pix <= color(30))) {

        pushMatrix();
        translate(xPos+XOFF, yPos+YOFF);
        rotate(ANGLE_1);

        if (FILL_IN) {
          noStroke();
          fill(255);
        } else { 
          stroke(255);
          strokeWeight(STROKEW);
        }
        if (CIRCLES) {
          ellipse(0, 0, DIA, DIA);
        } else {
          line(-LINE_LN, -LINE_LN, LINE_LN, LINE_LN);
        }
        popMatrix();
      }
    }
  }
}

void trameV() {

  for (int xPos=10; xPos<width-10; xPos+=INTERVALLE) {
    for (int yPos=10; yPos<height-10; yPos+=INTERVALLE) {
      color pix = glyphs[INDEX].get(int(xPos), int(yPos));
      if ((pix >= color(0)) && (pix <= color(30))) {

        pushMatrix();
        translate(xPos-XOFF, yPos-YOFF);
        rotate(-ANGLE_1+radians(90));

        if (FILL_IN) {
          noStroke();
          fill(255);
        } else { 
          stroke(255);
          strokeWeight(STROKEW);
        }
        if (CIRCLES) {

          ellipse(0, 0, DIA, DIA);
        } else {
          line(-LINE_LN2, -LINE_LN2, LINE_LN2, LINE_LN2);
        }
        popMatrix();
      }
    }
  }
}

/////////////////////////////////// On charge nos images par ici
void glyphInit() {
  glyphs = new PImage[26];

  for (int i=0; i<glyphs.length; i++) {
    glyphs[i] = loadImage("Caviar/Caviar_"+nf(i, 3)+".png");
    glyphs[i].resize(600, 600);
  }
  imageMode(CENTER); 
}

